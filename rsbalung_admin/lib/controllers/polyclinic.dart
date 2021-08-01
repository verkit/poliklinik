import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/models/polyclinic/polyclinic_model.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/firestore.dart';
import 'package:rsbalung_admin/snackbar.dart';

class PolyController extends GetxController {
  final FirestoreService repository;
  PolyController(this.repository);

  List<PolyclinicModel> polyclinics = <PolyclinicModel>[];

  Future<List<PolyclinicModel>> getPolyclinics() async {
    polyclinics = await repository.getPolyclinics();
    return polyclinics;
  }

  RefreshController refreshController = RefreshController(initialRefresh: false);

  onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    polyclinics.clear();
    polyclinics = await getPolyclinics();
    update();
    refreshController.refreshCompleted();
  }

  onDeletePoli(int i) {
    repository.deletePolyclinic(polyclinics[i]);
    onRefresh();
  }

  bool isLoading = false;
  bool isEdit = false;

  void gotoForm({PolyclinicModel? data}) {
    if (data != null) {
      isEdit = true;
      setPoli(data);
    } else {
      isEdit = false;
    }
    Get.toNamed(MyRouter.formPoliclinic, arguments: data);
  }

  // * Detail Page
  PolyclinicModel? selectedPoli = PolyclinicModel();
  TextEditingController klinik = TextEditingController();

  setPoli(PolyclinicModel data) async {
    isLoading = true;
    selectedPoli = await repository.getPolyclinic(data.id!);
    klinik.text = selectedPoli!.nama!;
    isLoading = false;
    update();
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
    update();
  }

  var formKey = GlobalKey<FormState>();
  createPoli() {
    if (formKey.currentState!.validate()) {
      if (image != null) {
        EasyLoading.show();
        isLoading = true;
        update();
        PolyclinicModel data = PolyclinicModel(
          nama: klinik.text,
        );
        repository.createPolyclinic(data, File(image!.path));
        Get.back();
        EasyLoading.dismiss();
        onClear();
        onRefresh();
        isLoading = false;
        update();
      } else {
        Snackbar.error('Gambar harus diisi');
      }
    }
  }

  updatePoli() {
    selectedPoli!.nama = klinik.text;
    if (image == null) {
      repository.updatePolyclinic(selectedPoli!);
    } else {
      repository.updatePolyclinic(selectedPoli!, file: File(image!.path));
    }
    Get.back();
    onClear();
    selectedPoli = null;
    onRefresh();
  }

  @override
  void onInit() {
    isLoading = true;
    getPolyclinics().then((value) => polyclinics = value).whenComplete(() {
      isLoading = false;
      update();
    });
    super.onInit();
  }
}
