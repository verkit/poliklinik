import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsbalung_admin/models/doctor/doctor_model.dart';

class CheckModel {
  CheckModel({
    this.pasien,
    this.pembayaran,
    this.tanggalPeriksa,
    this.tanggalDaftar,
    this.dokter,
    this.antrian,
    this.selesai,
    this.id,
  });

  Pasien? pasien;
  String? pembayaran;
  String? tanggalPeriksa;
  String? tanggalDaftar;
  DoctorModel? dokter;
  int? antrian;
  bool? selesai;
  String? id;

  factory CheckModel.fromRawJson(String str) => CheckModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckModel.fromJson(Map<String, dynamic> json) => CheckModel(
      pasien: Pasien.fromJson(json["pasien"]),
      pembayaran: json["pembayaran"],
      tanggalPeriksa: json["tanggal_periksa"],
      tanggalDaftar: json["tanggal_daftar"],
      dokter: DoctorModel.fromJson(json["dokter"]),
      antrian: json["antrian"]);

  factory CheckModel.fromSnapshot(DocumentSnapshot snapshot) => CheckModel(
        id: snapshot.id,
        pasien: Pasien.fromJson(snapshot.get("pasien")),
        pembayaran: snapshot.get("pembayaran"),
        tanggalPeriksa: snapshot.get("tanggal_periksa"),
        tanggalDaftar: snapshot.get("tanggal_daftar"),
        dokter: DoctorModel.fromJson(snapshot.get("dokter")),
        antrian: snapshot.get("antrian"),
        selesai: snapshot.get('selesai'),
      );

  Map<String, dynamic> toJson() => {
        "pasien": pasien!.toJson(),
        "pembayaran": pembayaran,
        "tanggal_periksa": tanggalPeriksa,
        "tanggal_daftar": tanggalDaftar,
        "dokter": dokter!.toJson(),
        "antrian": antrian,
        "selesai": selesai,
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
    this.userUid,
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
  String? userUid;

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
        userUid: json["user_uid"],
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
        "user_uid": userUid,
      };
}