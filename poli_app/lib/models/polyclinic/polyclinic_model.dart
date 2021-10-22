import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PolyclinicModel extends Equatable {
  String? nama;
  String? gambar;
  bool? open;
  String? id;

  PolyclinicModel({this.nama, this.gambar, this.id, this.open});

  factory PolyclinicModel.fromSnapshot(DocumentSnapshot snapshot) {
    return PolyclinicModel(
      gambar: snapshot.get('gambar'),
      nama: snapshot.get('nama'),
      open: snapshot.get('is_open'),
      id: snapshot.id,
    );
  }

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'gambar': gambar,
        'is_open': open,
      };

  @override
  List<Object?> get props => [nama, gambar, open];
}
