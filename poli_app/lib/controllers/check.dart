import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/models/polyclinic/polyclinic_model.dart';
import 'package:poli_app/services/firestore.dart';

class CheckController extends GetxController {
  bool isLoading = false;

  List<PolyclinicModel> polys = [];
  PolyclinicModel selectedPoli = PolyclinicModel();
  selectPoli(PolyclinicModel value) async {
    EasyLoading.show();
    selectedPoli = value;
    doctors = await FirestoreService.getDoctors(poli: selectedPoli.nama);
    EasyLoading.dismiss();
    update();
  }

  List<DoctorModel>? doctors;
  DoctorModel? selectedDoctor;
  selectDoctor(DoctorModel value) {
    weekday.clear();
    selectedDoctor = value;
    for (var item in selectedDoctor!.jadwal!) {
      if (item.hari == 'senin') {
        weekday.add(1);
      } else if (item.hari == 'selasa') {
        weekday.add(2);
      } else if (item.hari == 'rabu') {
        weekday.add(3);
      } else if (item.hari == 'kamis') {
        weekday.add(4);
      } else if (item.hari == 'jumat') {
        weekday.add(5);
      } else if (item.hari == 'sabtu') {
        weekday.add(6);
      } else {
        weekday.add(7);
      }
    }
    print(weekday.contains(7));
    update();
  }

  String? selectedPembayaran;
  selectPembayaran(String value) {
    selectedPembayaran = value;
    update();
  }

  String selectDate(DateTime date) {
    var dateFormat = DateFormat('dd-MM-yyyy');
    return dateFormat.format(date);
  }

  List<int> weekday = [];

  @override
  void onInit() async {
    isLoading = true;
    polys = await FirestoreService.getPolyclinics(open: true);
    isLoading = false;
    update();
    super.onInit();
  }
}
