import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:rsbalung_admin/models/check/check_model.dart';
import 'package:rsbalung_admin/models/doctor/doctor_model.dart';
import 'package:rsbalung_admin/models/polyclinic/polyclinic_model.dart';
import 'package:rsbalung_admin/snackbar.dart';
import 'package:rsbalung_admin/strings.dart';

class FirestoreService {
  //! Send data dummy
  Future sendDataDoctor() async {
    try {
      for (var item in doctors) {
        await FirebaseFirestore.instance.collection('doctors').add(item.toJson());
      }
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  Future sendDataPolyclinic() async {
    try {
      for (var item in poliklinik) {
        await FirebaseFirestore.instance.collection('polyclinics').add(item.toJson());
      }
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  //!
  //! HomePage
  //!
  Future<List<CheckModel>> checksToday(CheckModel data) async {
    try {
      List<CheckModel> data = [];
      var date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      await FirebaseFirestore.instance
          .collection('checks')
          .where('tanggal_periksa', isEqualTo: date)
          .get()
          .then((value) {
        for (var item in value.docs) {
          data.add(CheckModel.fromSnapshot(item));
        }
      });
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return [];
    }
  }

  //!
  //! Doctor
  //!
  Future<List<DoctorModel>> getDoctors() async {
    List<DoctorModel> data = [];
    try {
      await FirebaseFirestore.instance.collection('doctors').get().then((value) {
        for (var item in value.docs) {
          data.add(DoctorModel.fromSnapshot(item));
        }
      });
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  Future<DoctorModel> getDoctor(String uid) async {
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

  Future createDoctor(DoctorModel data) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance
          .collection('doctors')
          .add(data.toJson())
          .whenComplete(() => Snackbar.success('Berhasil menambahkan dokter'));
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future updateDoctor(String uid, DoctorModel data) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(uid)
          .update(data.toJson())
          .whenComplete(() => Snackbar.success('Berhasil memperbarui dokter'));
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future deleteDoctor(String uid) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(uid)
          .delete()
          .whenComplete(() => Snackbar.success('Berhasil menghapus dokter'));
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  //!
  //! Polyclinic
  //!
  Future<List<PolyclinicModel>> getPolyclinics() async {
    List<PolyclinicModel> data = [];
    try {
      await FirebaseFirestore.instance.collection('polyclinics').get().then((value) {
        for (var item in value.docs) {
          data.add(PolyclinicModel.fromSnapshot(item));
        }
      });
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  Future<PolyclinicModel> getPolyclinic(String uid) async {
    PolyclinicModel data = PolyclinicModel();
    try {
      var temp = await FirebaseFirestore.instance.collection('polyclinics').doc(uid).get();
      data = PolyclinicModel.fromSnapshot(temp);
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  Future createPolyclinic(PolyclinicModel data, File file) async {
    try {
      var uploadImage = FirebaseStorage.instance.ref('poliklinik').child(p.basename(file.path));
      await uploadImage.putFile(file).then((s) async {
        await s.ref.getDownloadURL().then((value) async {
          data.gambar = value;
          await FirebaseFirestore.instance.collection('polyclinics').add(data.toJson());
        });
      }).whenComplete(() => Snackbar.success('Berhasil menambahkan poli'));
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    }
  }

  Future updatePolyclinic(PolyclinicModel data, {File? file}) async {
    try {
      EasyLoading.show();
      if (file != null) {
        var uploadImage = FirebaseStorage.instance.ref('poliklinik').child(p.basename(file.path));
        await uploadImage.putFile(file).then((s) async {
          await s.ref.getDownloadURL().then((value) async {
            data.gambar = value;
            await FirebaseFirestore.instance.collection('polyclinics').doc(data.id).update(data.toJson());
          });
        }).whenComplete(() => Snackbar.success('Berhasil menambahkan poli'));
      } else {
        await FirebaseFirestore.instance.collection('polyclinics').doc(data.id).update(data.toJson());
      }
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future deletePolyclinic(PolyclinicModel data) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance.collection('polyclinics').doc(data.id).delete().then((value) {
        FirebaseStorage.instance.refFromURL(data.gambar!).delete();
      });
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  //!
  //! Checks
  //!
  Future<List<CheckModel>> getChecks() async {
    List<CheckModel> data = [];
    try {
      var dateFormat = DateFormat('dd-MM-yyyy');
      //Todo : ubah ini gan
      await FirebaseFirestore.instance
          .collection('checks')
          // .where('tanggal_periksa', isEqualTo: dateFormat.format(DateTime.now()))
          .where('selesai', isEqualTo: false)
          .get()
          .then((value) {
        for (var item in value.docs) {
          data.add(CheckModel.fromSnapshot(item));
        }
      });
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  Future<CheckModel> getCheck(String uid) async {
    CheckModel data = CheckModel();
    try {
      var temp = await FirebaseFirestore.instance.collection('checks').doc(uid).get();
      data = CheckModel.fromSnapshot(temp);
      return data;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return data;
    }
  }

  Future<bool> updateCheck(CheckModel data) async {
    try {
      await FirebaseFirestore.instance.collection('checks').doc(data.id).update(data.toJson());
      return true;
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
      return false;
    }
  }
}
