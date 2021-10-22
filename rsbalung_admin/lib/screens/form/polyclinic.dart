import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rsbalung_admin/models/polyclinic/polyclinic_model.dart';
import 'package:rsbalung_admin/services/firestore.dart';
import 'package:rsbalung_admin/snackbar.dart';
import 'package:rsbalung_admin/validator.dart';

class FormPolyclinicScreen extends StatefulWidget {
  const FormPolyclinicScreen({Key? key, this.data}) : super(key: key);
  final PolyclinicModel? data;
  @override
  State<FormPolyclinicScreen> createState() => _FormPolyclinicScreenState();
}

class _FormPolyclinicScreenState extends State<FormPolyclinicScreen> {
  bool isLoading = false;
  bool isEdit = false;
  final FirestoreService repository = FirestoreService();

  PolyclinicModel? selectedPoli = PolyclinicModel();
  TextEditingController klinik = TextEditingController();

  @override
  void initState() {
    if (widget.data != null) {
      isEdit = true;
      setPoli(widget.data!);
    }
    super.initState();
  }

  setPoli(PolyclinicModel data) async {
    isLoading = true;
    selectedPoli = await repository.getPolyclinic(data.id!);
    klinik.text = selectedPoli!.nama!;
    isLoading = false;
    setState(() {});
  }

  onBack() {
    Get.back();
    onClear();
    selectedPoli = PolyclinicModel();
  }

  onClear() {
    klinik.clear();
    image = null;
  }

  XFile? image;
  getImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  var formKey = GlobalKey<FormState>();
  createPoli() async {
    if (formKey.currentState!.validate()) {
      if (image != null) {
        await EasyLoading.show();

        PolyclinicModel data = PolyclinicModel(
          nama: klinik.text,
          open: false,
        );
        await repository.createPolyclinic(data, File(image!.path));
        await EasyLoading.dismiss();
        await Future.delayed(Duration(milliseconds: 2050));
        Get.back(result: true);
      } else {
        Snackbar.error('Gambar harus diisi');
      }
    }
  }

  updatePoli() async {
    try {
      await EasyLoading.show();
      selectedPoli!.nama = klinik.text;
      if (image == null) {
        await repository.updatePolyclinic(selectedPoli!);
      } else {
        await repository.updatePolyclinic(selectedPoli!, file: File(image!.path));
      }
      await EasyLoading.dismiss();
      await Future.delayed(Duration(seconds: 1), () {
        Get.back(result: true);
      });
    } catch (e) {}
  }

  @override
  void dispose() {
    klinik.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: onBack, icon: Icon(Icons.arrow_back)),
        title: Text(!isEdit ? 'Tambah Poli' : 'Ubah Poli'),
        actions: [
          IconButton(
            onPressed: () {
              !isEdit ? createPoli() : updatePoli();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        image != null
                            ? Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: ExtendedImage.file(
                                    File(image!.path),
                                    width: 48,
                                    height: 48,
                                  ),
                                ),
                              )
                            : selectedPoli == null
                                ? SizedBox()
                                : selectedPoli!.gambar == null
                                    ? SizedBox()
                                    : Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child: ExtendedImage.network(
                                            selectedPoli!.gambar!,
                                            width: 48,
                                            height: 48,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                        Expanded(
                          child: TextFormField(
                            controller: klinik,
                            validator: (val) => Validation.required(val!),
                            decoration: InputDecoration(labelText: 'Nama'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        getImage();
                      },
                      child: Text(isEdit ? 'Ubah gambar' : 'Tambah gambar'),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
