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
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
