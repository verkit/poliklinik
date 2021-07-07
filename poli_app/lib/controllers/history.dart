import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/models/check/check_model.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/services/firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryController extends GetxController {
  RxList<CheckModel> histories = <CheckModel>[].obs;
  Rx<bool> isLoading = true.obs;

  RefreshController refreshController = RefreshController();

  CheckModel selectedCheck = CheckModel();
  gotoDetail(CheckModel model) {
    selectedCheck = model;
    update();
    Get.toNamed(MyRouter.detailHistory);
  }

  loadHistory() async {
    await FirestoreService.getCheckHistory(Get.find<AuthController>().user.value!.uid).then((value) {
      histories.value = value!;
      histories.sort((b, a) {
        var dateFormat = DateFormat('dd-MM-yyyy');
        return dateFormat.parse(a.tanggalPeriksa!).compareTo(dateFormat.parse(b.tanggalPeriksa!));
      });
      isLoading(false);
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}
