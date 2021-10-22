import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/profile.dart';
import 'package:poli_app/strings.dart';
import 'package:poli_app/validator.dart';

class FormProfileScreen extends GetView<ProfileController> {
  const FormProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<ProfileController>(
          init: controller,
          builder: (_) {
            return Text(_.title);
          },
        ),
      ),
      body: GetBuilder<ProfileController>(
        init: controller,
        builder: (_) {
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Masukkan Identitas'),
                      Form(
                        key: formKey,
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
                                SizedBox(height: 8),
                                DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  hint: Text('Pilih Jenis Kelamin'),
                                  onChanged: (String? newValue) {
                                    controller.selectJenisKelamin(newValue!);
                                  },
                                  validator: (val) {
                                    if (val == null) 'Harus diisi';
                                  },
                                  value:
                                      controller.selectedJenisKelamin.isEmpty ? null : controller.selectedJenisKelamin,
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
                            // TextFormField(
                            //   controller: controller.noTelp,
                            //   validator: (val) => Validation.required(val!),
                            //   decoration: InputDecoration(labelText: 'No. Telp'),
                            //   keyboardType: TextInputType.phone,
                            // ),
                            TextFormField(
                              controller: controller.nik,
                              validator: (val) => Validation.required(val!),
                              decoration: InputDecoration(labelText: 'NIK'),
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.updateProfile();
                          }
                        },
                        child: Text('Simpan'),
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
