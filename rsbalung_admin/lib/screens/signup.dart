import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/models/polyclinic/polyclinic_model.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/auth.dart';
import 'package:rsbalung_admin/strings.dart';

import '../snackbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailSignup = TextEditingController();
  TextEditingController passwordSignup = TextEditingController();
  TextEditingController passwordConfSignup = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool obsecurePass = true;
  bool obsecurePassConf = true;

  String? gender;
  PolyclinicModel? role;
  List<String>? roleOpt = ['senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu', 'minggu'];

  changeGender(String? value) {
    gender = value;
    setState(() {});
  }

  changeRole(var val) {
    role = val;
    setState(() {});
  }

  String? validateNotNull(String? val) {
    if (val == null || val.isEmpty) {
      return 'Wajib diisi';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Pendaftaran Admin',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12),
                      Text('Silahkan isi form dibawah ini'),
                      SizedBox(height: 16),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          controller: name,
                          validator: validateNotNull,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nama',
                            hintStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          controller: address,
                          validator: validateNotNull,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Alamat',
                            hintStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              Text('Jenis Kelamin'),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: const Text(
                                        'Laki-Laki',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      leading: Radio<String>(
                                        value: "L",
                                        groupValue: gender,
                                        onChanged: (String? value) {
                                          changeGender(value);
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: const Text(
                                        'Perempuan',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      leading: Radio<String>(
                                        value: "P",
                                        groupValue: gender,
                                        onChanged: (String? value) {
                                          changeGender(value);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          controller: phone,
                          validator: validateNotNull,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'No HP',
                            hintStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          controller: emailSignup,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Wajib diisi';
                            } else if (!val.isEmail) {
                              return 'Email tidak valid';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          controller: passwordSignup,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Wajib diisi';
                            } else if (val.length <= 8) {
                              return 'Password minimal 8 huruf/angka/simbol';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obsecurePass,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsecurePass = !obsecurePass;
                                });
                              },
                              icon: obsecurePass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          controller: passwordConfSignup,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Wajib diisi';
                            } else if (val != passwordSignup.text) {
                              return 'Password tidak sama';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obsecurePassConf,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: 'Konfirmasi Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsecurePassConf = !obsecurePassConf;
                                });
                              },
                              icon: obsecurePassConf ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<PolyclinicModel>(
                          hint: Text('Pilih Jenis Admin'),
                          value: role,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: TextStyle(fontSize: 14),
                          elevation: 16,
                          onChanged: changeRole,
                          isExpanded: true,
                          items: poliklinik.map<DropdownMenuItem<PolyclinicModel>>((PolyclinicModel value) {
                            return DropdownMenuItem<PolyclinicModel>(
                              value: value,
                              child: Text(
                                value.nama!,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (gender == null) {
                              Snackbar.info('Harap isi jenis kelamin');
                            } else if (role == null) {
                              Snackbar.info('Harap isi jenis admin');
                            } else {
                              AuthFirebase.signup(
                                email: emailSignup.text,
                                password: passwordSignup.text,
                                address: address.text,
                                gender: gender!,
                                name: name.text,
                                phone: phone.text,
                                role: role!.nama!,
                              );
                            }
                          }
                        },
                        child: Text('Daftar'),
                        style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 40)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(MyRouter.login);
                        },
                        child: Text('Sudah punya akun? Login'),
                        style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 40)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
