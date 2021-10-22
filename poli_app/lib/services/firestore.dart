import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/models/check/check_model.dart';
import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/models/polyclinic/polyclinic_model.dart';
import 'package:poli_app/snackbar.dart';
import 'package:poli_app/strings.dart';

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
      await FirebaseFirestore.instance
          .collection('checks')
          .where('pasien.user_uid', isEqualTo: uid)
          .get()
          .then((value) {
        for (var item in value.docs) {
          check.add(CheckModel.fromJson(item.data()));
        }
      });
      return check;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  static Future<List> checkRegistered(String date, Pasien pasien) async {
    var snapshot =
        await FirebaseFirestore.instance.collection('checks').where('tanggal_periksa', isEqualTo: date).get();

    List<CheckModel> data = [];
    for (var item in snapshot.docs) {
      data.add(CheckModel.fromSnapshot(item));
    }

    if (data.where((e) => e.pasien!.userUid == pasien.userUid).toList().isNotEmpty)
      return [false, 'Hanya bisa melakukan 1 kali pendaftaran'];

    if (data.length >= 100) return [false, 'Pendaftaran penuh'];

    return [true, ''];
  }

  /// Mendapatkan total antrian pada tanggal yang sama
  static Future<List<int>?> nomorAntrian(DoctorModel dokter, String tanggal) async {
    try {
      List<int> antrian = [];

      /// Mendapatkan antrian registrasi
      await FirebaseFirestore.instance
          .collection('checks')
          .where('tanggal_periksa', isEqualTo: tanggal)
          .get()
          .then((value) {
        List<CheckModel> _checks = [];
        if (value.docs.length != 0) {
          for (var item in value.docs) {
            _checks.add(CheckModel.fromJson(item.data()));
          }
          var a = _checks.reduce((current, next) => current.antrian! > next.antrian! ? current : next);
          antrian.add(a.antrian! + 1);
        } else {
          antrian.add(1);
        }
      });

      /// Mendapatkan antrian poli
      await FirebaseFirestore.instance
          .collection('checks')
          .where('dokter.poliklinik', isEqualTo: dokter.poliklinik)
          .where('tanggal_periksa', isEqualTo: tanggal)
          .get()
          .then((value) {
        List<CheckModel> _checks = [];
        if (value.docs.length != 0) {
          for (var item in value.docs) {
            _checks.add(CheckModel.fromJson(item.data()));
          }
          var poli = _checks.reduce((current, next) => current.antrian_poli! > next.antrian_poli! ? current : next);
          print(poli.antrian_poli);
          antrian.add(poli.antrian_poli! + 1);
          print(antrian);
        } else {
          antrian.add(1);
          print(antrian);
        }
      });
      return antrian;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  static Future createUser(Pasien data) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Get.put<AuthController>(AuthController()).user.value!.uid)
          .set(data.toJson());
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  static Future updateUser(Pasien data) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(data.userUid).update(data.toJson());
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  //!
  //! Polyclinic
  //!
  static Future<List<PolyclinicModel>> getPolyclinics({bool? open}) async {
    List<PolyclinicModel> data = [];
    try {
      if (open != null) {
        await FirebaseFirestore.instance
            .collection('polyclinics')
            .where('is_open', isEqualTo: open)
            .get()
            .then((value) {
          for (var item in value.docs) {
            data.add(PolyclinicModel.fromSnapshot(item));
          }
        });
      } else {
        await FirebaseFirestore.instance.collection('polyclinics').get().then((value) {
          for (var item in value.docs) {
            data.add(PolyclinicModel.fromSnapshot(item));
          }
        });
      }
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  //!
  //! Doctor
  //!
  static Future<List<DoctorModel>> getDoctors({String? poli}) async {
    List<DoctorModel> data = [];
    try {
      if (poli != null) {
        await FirebaseFirestore.instance.collection('doctors').where('poliklinik', isEqualTo: poli).get().then((value) {
          for (var item in value.docs) {
            data.add(DoctorModel.fromSnapshot(item));
          }
        });
      } else {
        await FirebaseFirestore.instance.collection('doctors').get().then((value) {
          for (var item in value.docs) {
            data.add(DoctorModel.fromSnapshot(item));
          }
        });
      }

      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  static Future<DoctorModel> getDoctor(String uid) async {
    DoctorModel data = DoctorModel();
    try {
      var refdata = await FirebaseFirestore.instance.collection('doctors').doc(uid).get();
      data = DoctorModel.fromSnapshot(refdata);
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  Future sendDataDummy() async {
    try {
      for (var item in poliklinik) {
        await FirebaseFirestore.instance.collection('polyclinics').add(item.toJson()).then(
          (value) async {
            var dokter = doctors.where((element) => element.poliklinik == item.nama).toList();
            for (var d in dokter) {
              await FirebaseFirestore.instance.collection('doctors').add(d.toJson());
            }
          },
        );
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }
}
