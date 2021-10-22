import 'package:get/get.dart';
import 'package:rsbalung_admin/models/doctor/doctor_model.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class DoctorController extends GetxController {
  final FirestoreService repository;
  DoctorController(this.repository);

  List<DoctorModel> doctors = [];
  bool isEdit = false;
  bool isLoading = false;

  Future<List<DoctorModel>> getDoctors() async {
    doctors = await repository.getDoctors();
    return doctors;
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
}
