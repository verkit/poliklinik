import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/models/check/check_model.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class WaitingController extends GetxController {
  final FirestoreService repository;
  WaitingController(this.repository);

  bool isLoading = false;

  List<CheckModel> checks = [];

  Future _getCheckData() async {
    checks = await repository.getChecks();
    checks.sort((a, b) => a.antrian!.compareTo(b.antrian!));
    waitingNumber = checks.first.antrian;
    update();
  }

  getChecks() {
    isLoading = true;
    update();
    _getCheckData();
    isLoading = false;
    update();
  }

  RefreshController refreshController = RefreshController(initialRefresh: false);
  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    checks.clear();
    _getCheckData();
    update();
    refreshController.refreshCompleted();
  }

  CheckModel? selectedCheck;
  getDetail(int i) async {
    selectedCheck = await repository.getCheck(checks[i].id!);
    Get.toNamed(MyRouter.checkDetail);
  }

  int? waitingNumber = 0;
  checkedWaitingList() {
    selectedCheck!.selesai = true;
    repository.updateCheck(selectedCheck!);
    Get.back();
    onRefresh();
  }

  @override
  void onInit() {
    getChecks();
    super.onInit();
  }
}
