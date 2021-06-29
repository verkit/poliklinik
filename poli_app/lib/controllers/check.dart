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
import 'package:poli_app/services/firestore.dart';
import 'package:poli_app/strings.dart';

class CheckController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController umur = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController agama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController kelurahan = TextEditingController();
  TextEditingController kecamatan = TextEditingController();
  TextEditingController kabupaten = TextEditingController();
  TextEditingController provinsi = TextEditingController();
  TextEditingController noTelp = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  // DateRangePickerController tanggalLahir = DateRangePickerController();
  final formKey = GlobalKey<FormState>();

  DoctorModel selectedDoctor = doctors.first;
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
        var antrian = await FirestoreService.getAmountChecks(selectedDoctor.nama!, tanggal.text);
        CheckModel data = CheckModel(
          dokter: selectedDoctor,
          pembayaran: selectedPembayaran,
          pasien: Pasien(
            agama: agama.text,
            alamat: alamat.text,
            jenisKelamin: selectedJenisKelamin,
            kabupaten: kabupaten.text,
            kecamatan: kecamatan.text,
            kelurahan: kelurahan.text,
            nama: nama.text,
            nik: nik.text,
            noTelp: noTelp.text,
            provinsi: provinsi.text,
            tanggalLahir: tanggalLahir.text,
            tempatLahir: tempatLahir.text,
            umur: umur.text,
          ),
          tanggalPeriksa: tanggal.text,
          userUid: Get.find<AuthController>().user.value!.uid,
          antrian: antrian,
        );
        await FirestoreService.registerForCheck(data).whenComplete(() {
          Get.put<MainController>(MainController()).selectedIndex.value = 2;
          Get.offAllNamed(MyRouter.main);
        });
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
