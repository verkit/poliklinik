import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/models/check/check_model.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/auth.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class WaitingController extends GetxController {
  final FirestoreService repository;
  WaitingController(this.repository);

  bool isLoading = false;
  String? role;

  List<CheckModel> checks = [];

  Future _getCheckData() async {
    checks = await repository.getChecks();
    checks.sort((a, b) => a.antrian!.compareTo(b.antrian!));
    if (role == 'pendaftaran') {
      waitingNumber = checks.isNotEmpty ? checks.first.antrian : 0;
    } else {
      var checksUndone = checks.where((e) => e.selesai_poli == false).toList();
      checksUndone.sort((a, b) => a.antrian_poli!.compareTo(b.antrian_poli!));
      print(checksUndone);
      waitingNumber = checksUndone.isNotEmpty ? checksUndone.first.antrian_poli : 0;
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

  RefreshController refreshController = RefreshController(initialRefresh: false);
  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    checks.clear();
    getChecks();
    update();
    refreshController.refreshCompleted();
  }

  CheckModel? selectedCheck;
  getDetail(int i) async {
    selectedCheck = await repository.getCheck(checks[i].id!);
    Get.toNamed(MyRouter.checkDetail);
  }

  int? waitingNumber = 0;
  checkedWaitingList() async {
    if (role == 'pendaftaran') {
      selectedCheck!.selesai = true;
    } else {
      selectedCheck!.selesai_poli = true;
    }
    repository.updateCheck(selectedCheck!);
    Get.back();
    onRefresh();
  }

  @override
  void onInit() async {
    role = await AuthFirebase.getRole();
    await getChecks();
    super.onInit();
  }
}
