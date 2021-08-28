import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/controllers/main.dart';
import 'package:poli_app/models/check/check_model.dart';
import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/services/auth.dart';
import 'package:poli_app/services/firestore.dart';
import 'package:poli_app/strings.dart';

class CheckController extends GetxController {
  TextEditingController tanggal = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  DoctorModel selectedDoctor = DoctorModel();
  selectDoctor(DoctorModel value) {
    selectedDoctor = value;
    update();
  }

  String selectedPembayaran = payments.first;
  selectPembayaran(String value) {
    selectedPembayaran = value;
    update();
  }

  String selectedJenisKelamin = jenisKelamin.first;
  selectJenisKelamin(String value) {
    selectedJenisKelamin = value;
    update();
  }

  String selectDate(DateTime date) {
    var dateFormat = DateFormat('dd-MM-yyyy');
    return dateFormat.format(date);
  }

  registerForCheck() async {
    try {
      EasyLoading.show();
      if (formKey.currentState!.validate()) {
        var antrian = await FirestoreService.nomorAntrian(selectedDoctor, tanggal.text);
        Pasien pasien = Pasien();
        await AuthFirebase.getProfile(Get.put<AuthController>(AuthController()).user.value!.uid).then((value) async {
          pasien = value!;
          CheckModel data = CheckModel(
            dokter: selectedDoctor,
            pembayaran: selectedPembayaran,
            pasien: pasien,
            tanggalPeriksa: tanggal.text,
            antrian: antrian!.first,
            antrian_poli: antrian.last,
            selesai: false,
            tanggalDaftar: DateFormat('dd-MM-yyyy').format(DateTime.now()),
          );
          await FirestoreService.registerForCheck(data).whenComplete(() {
            Get.put<MainController>(MainController()).selectedIndex.value = 2;
            Get.offAllNamed(MyRouter.main);
          });
        });
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void onInit() async {
    isLoading = true;
    Get.find<MainController>().doctors = await FirestoreService.getDoctors();
    isLoading = false;
    update();
    super.onInit();
  }
}
