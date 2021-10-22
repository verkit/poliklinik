import 'package:get/get.dart';
import 'package:rsbalung_admin/models/check/check_model.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class PasienController extends GetxController {
  final FirestoreService repository;
  PasienController(this.repository);

  List<Pasien> patiens = [];
  bool isLoading = false;

  Future<List<Pasien>> getPasien() async {
    patiens = await repository.getPatiens();
    return patiens;
  }

  //* Bagian detail
  List<CheckModel> patientHistories = [];
  int? indexPatient;
  gotoDetail(i) async {
    isLoading = true;
    await repository.getPatienHistories(patiens[i].userUid!).then((value) => patientHistories = value).whenComplete(() {
      isLoading = false;
      update();
    });
    indexPatient = i;
    Get.toNamed(MyRouter.pasien);
  }

  @override
  void onInit() {
    isLoading = true;
    getPasien().then((value) => patiens = value).whenComplete(() {
      isLoading = false;
      update();
    });
    super.onInit();
  }
}
