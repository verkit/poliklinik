import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccount {
  final String? role;
  final String? uid;
  final String? name;
  final String? address;
  final String? gender;
  final String? phone;

  UserAccount({
    this.role,
    this.uid,
    this.name,
    this.address,
    this.gender,
    this.phone,
  });

  factory UserAccount.fromSnapshot(DocumentSnapshot snapshot) {
    return UserAccount(
      uid: snapshot.get('user_uid'),
      name: snapshot.get('name'),
      role: snapshot.get('role'),
      address: snapshot.get('address'),
      gender: snapshot.get('gender'),
      phone: snapshot.get('phone'),
    );
  }

  Map<String, dynamic> toJson() => {
        "user_uid": uid,
        "name": name,
        "role": role,
        "gender": gender,
        "address": address,
        "phone": phone,
      };
}
