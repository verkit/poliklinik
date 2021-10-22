import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rsbalung_admin/models/polyclinic/polyclinic_model.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class PolyController extends GetxController {
  final FirestoreService repository;
  PolyController(this.repository);

  List<PolyclinicModel> polyclinics = <PolyclinicModel>[];

  Future<List<PolyclinicModel>> getPolyclinics() async {
    polyclinics = await repository.getPolyclinics();
    return polyclinics;
  }

  bool isLoading = false;
  bool isEdit = false;

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
