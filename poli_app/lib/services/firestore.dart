import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poli_app/models/check/check_model.dart';
import 'package:poli_app/snackbar.dart';

class FirestoreService {
  static Future registerForCheck(CheckModel data) async {
    try {
      await FirebaseFirestore.instance.collection('checks').add(data.toJson());
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  static Future<List<CheckModel>?> getCheckHistory(String uid) async {
    try {
      List<CheckModel> check = [];
      await FirebaseFirestore.instance.collection('checks').where('user_uid', isEqualTo: uid).get().then((value) {
        for (var item in value.docs) {
          check.add(CheckModel.fromJson(item.data()));
        }
      });
      return check;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  static Future<int?> getAmountChecks(String namaDokter, String tanggal) async {
    try {
      List<CheckModel> checks = [];
      var antrian;
      await FirebaseFirestore.instance
          .collection('checks')
          .where('dokter.nama', isEqualTo: namaDokter)
          .where('tanggal_periksa', isEqualTo: tanggal)
          .get()
          .then((value) {
        if (value.docs.length != 0) {
          for (var item in value.docs) {
            checks.add(CheckModel.fromJson(item.data()));
          }
          var a = checks.reduce((current, next) => current.antrian! > next.antrian! ? current : next);
          antrian = a.antrian! + 1;
        } else {
          antrian = 1;
        }
      });
      return antrian;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }
}
