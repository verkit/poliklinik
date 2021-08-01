import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/models/doctor/doctor_model.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class DoctorController extends GetxController {
  final FirestoreService repository;
  DoctorController(this.repository);

  List<DoctorModel> doctors = [];
  bool isEdit = false;
  bool isLoading = false;

  RefreshController refreshController = RefreshController(initialRefresh: false);

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    doctors.clear();
    doctors = await getDoctors();
    update();
    refreshController.refreshCompleted();
  }

  Future<List<DoctorModel>> getDoctors() async {
    doctors = await repository.getDoctors();
    return doctors;
  }

  deleteDoctor(int i) {
    repository.deleteDoctor(doctors[i].id!);
    onRefresh();
  }

  //* Bagian detail
  DoctorModel selectedDoctor = DoctorModel();
  TextEditingController nama = TextEditingController();
  TextEditingController spesialis = TextEditingController();
  String? jenisKelamin;
  List<Jadwal> jadwal = [];

  List<String>? days = ['senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu', 'minggu'];

  changeJenisKelamin(String? value) {
    jenisKelamin = value;
    update();
  }

  changeDay(var val) {
    day = val;
    update();
  }

  String? day;
  TextEditingController buka = TextEditingController(), tutup = TextEditingController();
  var formJadwalKey = GlobalKey<FormState>();

  addDay({int? index}) {
    if (formJadwalKey.currentState!.validate()) {
      if (index != null) {
        jadwal[index].hari = day;
        jadwal[index].pukul = Pukul(buka: buka.text, tutup: tutup.text);
      } else {
        jadwal.add(Jadwal(hari: day, pukul: Pukul(buka: buka.text, tutup: tutup.text)));
      }
      update();
      Get.back();
      buka.clear();
      tutup.clear();
    }
  }

  removeDay(int index) {
    jadwal.removeAt(index);
    update();
  }

  void gotoForm({DoctorModel? data}) {
    if (data != null) {
      isEdit = true;
      setData(data);
    } else {
      isEdit = false;
    }
    Get.toNamed(MyRouter.formDoctor, arguments: data);
  }

  var formKey = GlobalKey<FormState>();
  createDoctor() {
    if (formKey.currentState!.validate()) {
      DoctorModel data = DoctorModel(
        nama: nama.text,
        dokter: spesialis.text,
        jenisKelamin: jenisKelamin,
        jadwal: jadwal,
      );
      repository.createDoctor(data);
      clearForm();
      Get.back();
      onRefresh();
    }
  }

  updateDoctor() {
    if (formKey.currentState!.validate()) {
      selectedDoctor.nama = nama.text;
      selectedDoctor.dokter = spesialis.text;
      selectedDoctor.jenisKelamin = jenisKelamin;
      selectedDoctor.jadwal = jadwal;
      repository.updateDoctor(selectedDoctor.id!, selectedDoctor);
      Get.back();
      clearForm();
      onRefresh();
    }
  }

  void onBack() {
    clearForm();
    jenisKelamin = null;
    Get.back();
  }

  clearForm() {
    nama.clear();
    spesialis.clear();
    buka.clear();
    tutup.clear();
    jadwal.clear();
  }

  setData(DoctorModel data) async {
    selectedDoctor = await repository.getDoctor(data.id!);
    nama.text = selectedDoctor.nama!;
    spesialis.text = selectedDoctor.dokter!;
    jenisKelamin = selectedDoctor.jenisKelamin!;
    jadwal = selectedDoctor.jadwal!;
    update();
  }

  setDataJadwal(int i) {
    day = jadwal[i].hari;
    buka.text = jadwal[i].pukul!.buka!;
    tutup.text = jadwal[i].pukul!.tutup!;
  }

  @override
  void onInit() {
    isLoading = true;
    getDoctors().then((value) => doctors = value).whenComplete(() {
      isLoading = false;
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    nama.dispose();
    spesialis.dispose();
    buka.dispose();
    tutup.dispose();
    super.onClose();
  }
}
