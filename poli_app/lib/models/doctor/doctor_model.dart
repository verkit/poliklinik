// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  DoctorModel({
    this.nama,
    this.dokter,
    this.jenisKelamin,
    this.jadwal,
    this.id,
  });

  String? nama;
  String? dokter;
  String? jenisKelamin;
  List<Jadwal>? jadwal;
  String? id;

  factory DoctorModel.fromRawJson(String str) => DoctorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        nama: json["nama"],
        dokter: json["dokter"],
        jenisKelamin: json["jenis_kelamin"],
        jadwal: List<Jadwal>.from(json["jadwal"].map((x) => Jadwal.fromJson(x))),
      );

  factory DoctorModel.fromSnapshot(DocumentSnapshot snapshot) {
    return DoctorModel(
      id: snapshot.id,
      nama: snapshot.get('nama'),
      dokter: snapshot.get('dokter'),
      jadwal: List<Jadwal>.from(snapshot.get('jadwal').map((x) => Jadwal.fromJson(x))),
      jenisKelamin: snapshot.get('jenis_kelamin'),
    );
  }

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "dokter": dokter,
        "jenis_kelamin": jenisKelamin,
        "jadwal": List<dynamic>.from(jadwal!.map((x) => x.toJson())),
      };
}

class Jadwal {
  Jadwal({
    this.hari,
    this.pukul,
  });

  String? hari;
  Pukul? pukul;

  factory Jadwal.fromRawJson(String str) => Jadwal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        hari: json["hari"],
        pukul: Pukul.fromJson(json["pukul"]),
      );

  Map<String, dynamic> toJson() => {
        "hari": hari,
        "pukul": pukul!.toJson(),
      };
}

class Pukul {
  Pukul({
    this.buka,
    this.tutup,
  });

  String? buka;
  String? tutup;

  factory Pukul.fromRawJson(String str) => Pukul.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pukul.fromJson(Map<String, dynamic> json) => Pukul(
        buka: json["buka"],
        tutup: json["tutup"],
      );

  Map<String, dynamic> toJson() => {
        "buka": buka,
        "tutup": tutup,
      };
}
