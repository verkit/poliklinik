import 'dart:convert';

import 'package:poli_app/models/doctor/doctor_model.dart';

class CheckModel {
  CheckModel({
    this.pasien,
    this.pembayaran,
    this.tanggalPeriksa,
    this.dokter,
    this.userUid,
    this.antrian,
  });

  Pasien? pasien;
  String? pembayaran;
  String? tanggalPeriksa;
  DoctorModel? dokter;
  String? userUid;
  int? antrian;

  factory CheckModel.fromRawJson(String str) => CheckModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckModel.fromJson(Map<String, dynamic> json) => CheckModel(
      pasien: Pasien.fromJson(json["pasien"]),
      pembayaran: json["pembayaran"],
      tanggalPeriksa: json["tanggal_periksa"],
      dokter: DoctorModel.fromJson(json["dokter"]),
      userUid: json["user_uid"],
      antrian: json["antrian"]);

  Map<String, dynamic> toJson() => {
        "pasien": pasien!.toJson(),
        "pembayaran": pembayaran,
        "tanggal_periksa": tanggalPeriksa,
        "dokter": dokter!.toJson(),
        "user_uid": userUid,
        "antrian": antrian,
      };
}

class Pasien {
  Pasien({
    this.nama,
    this.tempatLahir,
    this.tanggalLahir,
    this.umur,
    this.jenisKelamin,
    this.agama,
    this.alamat,
    this.kelurahan,
    this.kecamatan,
    this.kabupaten,
    this.provinsi,
    this.noTelp,
    this.nik,
  });

  String? nama;
  String? tempatLahir;
  String? tanggalLahir;
  String? umur;
  String? jenisKelamin;
  String? agama;
  String? alamat;
  String? kelurahan;
  String? kecamatan;
  String? kabupaten;
  String? provinsi;
  String? noTelp;
  String? nik;

  factory Pasien.fromRawJson(String str) => Pasien.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        nama: json["nama"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
        umur: json["umur"],
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        alamat: json["alamat"],
        kelurahan: json["kelurahan"],
        kecamatan: json["kecamatan"],
        kabupaten: json["kabupaten"],
        provinsi: json["provinsi"],
        noTelp: json["no_telp"],
        nik: json["nik"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
        "umur": umur,
        "jenis_kelamin": jenisKelamin,
        "agama": agama,
        "alamat": alamat,
        "kelurahan": kelurahan,
        "kecamatan": kecamatan,
        "kabupaten": kabupaten,
        "provinsi": provinsi,
        "no_telp": noTelp,
        "nik": nik,
      };
}
