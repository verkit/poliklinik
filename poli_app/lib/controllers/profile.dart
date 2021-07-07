import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/models/check/check_model.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/services/auth.dart';
import 'package:poli_app/services/firestore.dart';

class ProfileController extends GetxController {
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
  TextEditingController nik = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String selectedJenisKelamin = '';
  selectJenisKelamin(String value) {
    selectedJenisKelamin = value;
    update();
  }

  String selectDate(DateTime date) {
    var dateFormat = DateFormat('dd-MM-yyyy');
    return dateFormat.format(date);
  }

  updateProfile() async {
    try {
      EasyLoading.show();
      // await FirestoreService.createUser(Pasien(userUid: Get.find<AuthController>().user.value!.uid));
      if (formKey.currentState!.validate()) {
        Pasien data = Pasien(
          agama: agama.text,
          alamat: alamat.text,
          jenisKelamin: selectedJenisKelamin,
          kabupaten: kabupaten.text,
          kecamatan: kecamatan.text,
          kelurahan: kelurahan.text,
          nama: nama.text,
          nik: nik.text,
          provinsi: provinsi.text,
          tanggalLahir: tanggalLahir.text,
          tempatLahir: tempatLahir.text,
          umur: umur.text,
          noTelp: Get.find<AuthController>().user.value!.phoneNumber,
          userUid: Get.find<AuthController>().user.value!.uid,
        );
        Get.put<AuthController>(AuthController()).user.value!.updateDisplayName(nama.text);
        await FirestoreService.updateUser(data);
        Get.offAllNamed(MyRouter.main);
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  String title = Get.arguments == 'daftar' ? 'Pendaftaran' : 'Edit Profil';

  @override
  void onInit() async {
    isLoading = true;
    await AuthFirebase.getProfile(Get.put<AuthController>(AuthController()).user.value!.uid).then((value) {
      nama.text = value?.nama ?? '';
      agama.text = value?.agama ?? '';
      alamat.text = value?.alamat ?? '';
      selectedJenisKelamin = value?.jenisKelamin ?? '';
      kabupaten.text = value?.kabupaten ?? '';
      kecamatan.text = value?.kecamatan ?? '';
      kelurahan.text = value?.kecamatan ?? '';
      nik.text = value?.nik ?? '';
      provinsi.text = value?.provinsi ?? '';
      tanggalLahir.text = value?.tanggalLahir ?? '';
      tempatLahir.text = value?.tempatLahir ?? '';
      umur.text = value?.umur ?? '';
    }).whenComplete(() {
      isLoading = false;
      update();
    });

    super.onInit();
  }
}
