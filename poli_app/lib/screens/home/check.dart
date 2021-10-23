import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/controllers/check.dart';
import 'package:poli_app/controllers/main.dart';
import 'package:poli_app/models/check/check_model.dart';
import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/models/polyclinic/polyclinic_model.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/services/auth.dart';
import 'package:poli_app/services/firestore.dart';
import 'package:poli_app/snackbar.dart';
import 'package:poli_app/strings.dart';
import 'package:poli_app/validator.dart';

class CheckScreen extends StatefulWidget {
  CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  final GlobalKey<FormFieldState> _poliKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _doctorKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _paymentKey = GlobalKey<FormFieldState>();
  TextEditingController tanggal = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran'),
        leading: IconButton(
          onPressed: () {
            Get.offNamed(MyRouter.main);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offNamed(MyRouter.main);
          return true;
        },
        child: GetBuilder<CheckController>(
          init: Get.find<CheckController>(),
          builder: (controller) {
            return controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Poliklinik'),
                                  SizedBox(height: 8),
                                ],
                              ),
                              DropdownButtonFormField<PolyclinicModel>(
                                key: _poliKey,
                                decoration: InputDecoration(border: InputBorder.none, isCollapsed: true, isDense: true),
                                isDense: false,
                                icon: Icon(Icons.keyboard_arrow_down),
                                validator: (val) {
                                  if (val == null) 'Harus diisi';
                                },
                                isExpanded: true,
                                hint: Text('Pilih Poliklinik'),
                                onChanged: (PolyclinicModel? newValue) {
                                  _doctorKey.currentState!.reset();
                                  controller.selectPoli(newValue!);
                                },
                                items: controller.polys.map<DropdownMenuItem<PolyclinicModel>>((PolyclinicModel value) {
                                  return DropdownMenuItem<PolyclinicModel>(
                                    value: value,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.nama!,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dokter'),
                                  SizedBox(height: 8),
                                ],
                              ),
                              DropdownButtonFormField<DoctorModel>(
                                key: _doctorKey,
                                decoration: InputDecoration(border: InputBorder.none, isCollapsed: true, isDense: true),
                                isDense: false,
                                enableFeedback: controller.doctors?.isNotEmpty,
                                icon: Icon(Icons.keyboard_arrow_down),
                                validator: (val) {
                                  if (val == null) 'Harus diisi';
                                },
                                isExpanded: true,
                                hint: Text('Pilih Dokter'),
                                onChanged: (DoctorModel? newValue) {
                                  controller.selectDoctor(newValue!);
                                },
                                items: controller.doctors?.map<DropdownMenuItem<DoctorModel>>((DoctorModel value) {
                                  return DropdownMenuItem<DoctorModel>(
                                    value: value,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.nama!,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          value.dokter!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              TextFormField(
                                controller: tanggal,
                                enabled: controller.selectedDoctor != null,
                                validator: (val) => Validation.required(val!),
                                decoration: InputDecoration(labelText: 'Tanggal Periksa'),
                                onTap: () async {
                                  DateTime? date = DateTime.now();
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    selectableDayPredicate: (val) {
                                      return val.day == DateTime.now().day || controller.weekday.contains(val.weekday);
                                    },
                                    lastDate:
                                        DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
                                  );
                                  if (date != null) {
                                    if (controller.weekday.contains(date.weekday)) {
                                      tanggal.text = controller.selectDate(date);
                                    } else {
                                      Snackbar.info('Tidak ada pelayanan untuk hari ini');
                                    }
                                  }
                                },
                              ),
                              SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pembayaran'),
                                  SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    key: _paymentKey,
                                    hint: Text('Pilih Pembayaran'),
                                    validator: (val) {
                                      if (val == null) 'Harus diisi';
                                    },
                                    isExpanded: true,
                                    onChanged: (String? newValue) {
                                      controller.selectPembayaran(newValue!);
                                    },
                                    items: payments.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(value),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16)
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                controller.selectedDoctor != null &&
                                controller.selectedPembayaran != null) {
                              Get.defaultDialog(
                                title: 'Konfirmasi',
                                content: Text('Apakah anda yakin?'),
                                onCancel: () {
                                  Get.back();
                                },
                                onConfirm: () async {
                                  try {
                                    EasyLoading.show();

                                    /// Melakukan pengecekan pendaftaran
                                    Pasien? pasien = await AuthFirebase.getProfile(
                                        Get.put<AuthController>(AuthController()).user.value!.uid);

                                    CheckModel data = CheckModel(
                                      dokter: controller.selectedDoctor,
                                      pembayaran: controller.selectedPembayaran,
                                      pasien: pasien,
                                      tanggalPeriksa: tanggal.text,
                                      selesai: false,
                                      selesai_poli: false,
                                      tanggalDaftar: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                    );

                                    List check = await FirestoreService.checkRegistered(tanggal.text, pasien!);
                                    if (!check.first) {
                                      Get.back();
                                      Snackbar.info(check.last);
                                    } else {
                                      var antrian = await FirestoreService.nomorAntrian(
                                        controller.selectedDoctor!,
                                        tanggal.text,
                                      );

                                      data.antrian = antrian!.first;
                                      data.antrian_poli = antrian.last;
                                      await FirestoreService.registerForCheck(data).whenComplete(() {
                                        Get.put<MainController>(MainController()).selectedIndex.value = 2;
                                        Get.offAllNamed(MyRouter.main);
                                        Get.toNamed(MyRouter.history);
                                      });
                                    }
                                  } finally {
                                    EasyLoading.dismiss();
                                  }
                                },
                              );
                            } else {
                              Snackbar.warning('Harap isi seluruh form');
                            }
                          },
                          child: Text('Daftar'),
                          style: ElevatedButton.styleFrom(fixedSize: Size(Get.width, 40)),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
