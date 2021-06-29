import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:poli_app/controllers/check.dart';
import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/strings.dart';
import 'package:poli_app/validator.dart';

class CheckScreen extends GetView<CheckController> {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran'),
        leading: IconButton(
            onPressed: () {
              Get.offNamed(MyRouter.main);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<CheckController>(
        init: controller,
        builder: (_) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Masukkan Identitas'),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.nama,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Nama'),
                      ),
                      TextFormField(
                        controller: controller.tempatLahir,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Tempat Lahir'),
                      ),
                      TextFormField(
                        controller: controller.tanggalLahir,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Tanggal Lahir'),
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());
                          date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) controller.tanggalLahir.text = controller.selectDate(date);
                        },
                      ),
                      TextFormField(
                        controller: controller.umur,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Umur'),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jenis Kelamin'),
                          SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            hint: Text('Pilih Jenis Kelamin'),
                            onChanged: (String? newValue) {
                              controller.selectJenisKelamin(newValue!);
                            },
                            validator: (val) {
                              if (val == null) 'Harus diisi';
                            },
                            items: jenisKelamin.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: controller.agama,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Agama'),
                      ),
                      TextFormField(
                        controller: controller.alamat,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Alamat'),
                      ),
                      TextFormField(
                        controller: controller.kelurahan,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Kelurahan'),
                      ),
                      TextFormField(
                        controller: controller.kecamatan,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Kecamatan'),
                      ),
                      TextFormField(
                        controller: controller.kabupaten,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Kabupaten'),
                      ),
                      TextFormField(
                        controller: controller.provinsi,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Provinsi'),
                      ),
                      TextFormField(
                        controller: controller.noTelp,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'No. Telp'),
                        keyboardType: TextInputType.phone,
                      ),
                      TextFormField(
                        controller: controller.nik,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'NIK'),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dokter'),
                          SizedBox(height: 8),
                        ],
                      ),
                      DropdownButtonFormField<DoctorModel>(
                        decoration: InputDecoration(border: InputBorder.none, isCollapsed: true, isDense: true),
                        isDense: false,
                        icon: Icon(Icons.keyboard_arrow_down),
                        validator: (val) {
                          if (val == null) 'Harus diisi';
                        },
                        isExpanded: true,
                        hint: Text('Pilih Dokter'),
                        onChanged: (DoctorModel? newValue) {
                          controller.selectDoctor(newValue!);
                        },
                        items: doctors.map<DropdownMenuItem<DoctorModel>>((DoctorModel value) {
                          return DropdownMenuItem<DoctorModel>(
                            value: value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.nama!,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  value.dokter!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      TextFormField(
                        controller: controller.tanggal,
                        validator: (val) => Validation.required(val!),
                        decoration: InputDecoration(labelText: 'Tanggal Periksa'),
                        onTap: () async {
                          DateTime? date = DateTime.now();
                          FocusScope.of(context).requestFocus(new FocusNode());
                          date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
                          );
                          if (date != null) controller.tanggal.text = controller.selectDate(date);
                        },
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pembayaran'),
                          SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            hint: Text('Pilih Pembayaran'),
                            validator: (val) {
                              if (val == null) 'Harus diisi';
                            },
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              controller.selectPembayaran(newValue!);
                            },
                            items: payments.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16)
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Konfirmasi',
                      content: Text('Apakah anda yakin?'),
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: controller.registerForCheck,
                    );
                  },
                  child: Text('Daftar'),
                  style: ElevatedButton.styleFrom(fixedSize: Size(Get.width, 40)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
