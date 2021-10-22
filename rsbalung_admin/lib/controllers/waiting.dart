import 'package:get/get.dart';
import 'package:rsbalung_admin/models/check/check_model.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/auth.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class WaitingController extends GetxController {
  final FirestoreService repository;
  WaitingController(this.repository);

  bool isLoading = false;
  String? role;
  int? waitingNumber = 0;
  int? kuota;

  List<CheckModel> checks = [];
  Future _getCheckData() async {
    checks = await repository.getChecks();
    checks.sort((a, b) => a.antrian!.compareTo(b.antrian!));
    kuota = 100 - checks.length;
    if (role == 'pendaftaran') {
      waitingNumber = checks.isNotEmpty ? checks.first.antrian : 0;
    } else {
      var checksUndone = checks.where((e) => e.selesai_poli == false && e.selesai == true).toList();
      checksUndone.sort((a, b) => a.antrian_poli!.compareTo(b.antrian_poli!));
      waitingNumber = checksUndone.isNotEmpty ? checksUndone.first.antrian_poli : 0;
      checks = checksUndone;
    }

    update();
  }

  Future getChecks() async {
    isLoading = true;
    update();
    await _getCheckData().whenComplete(() {
      isLoading = false;
      update();
    });
  }

  CheckModel? selectedCheck;
  getDetail(int i) async {
    selectedCheck = await repository.getCheck(checks[i].id!);
    Get.toNamed(MyRouter.checkDetail);
  }

  @override
  void onInit() async {
    role = await AuthFirebase.getRole();
    await getChecks();
    update();
    super.onInit();
  }
}
