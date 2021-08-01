import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/doctor.dart';
import 'package:rsbalung_admin/validator.dart';

class FormDoctorScreen extends GetView<DoctorController> {
  const FormDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dialog({int? index}) => SimpleDialog(
          contentPadding: EdgeInsets.all(16),
          title: Text('Jadwal dokter'),
          children: [
            GetBuilder<DoctorController>(
              init: controller,
              builder: (_) {
                return Form(
                  key: controller.formJadwalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<String>(
                        hint: Text('Pilih hari'),
                        value: controller.day,
                        elevation: 16,
                        onChanged: controller.changeDay,
                        isExpanded: true,
                        items: controller.days?.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      controller.day == null
                          ? Text(
                              'Harus diisi',
                              style: TextStyle(color: Colors.red),
                            )
                          : SizedBox(),
                      TextFormField(
                        controller: controller.buka,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Harus diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: '07.00', labelText: 'Jam Mulai'),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: controller.tutup,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Harus diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: '17.00', labelText: 'Jam Tutup'),
                        keyboardType: TextInputType.number,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.addDay(index: index);
                        },
                        child: Text('Simpan'),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: controller.onBack, icon: Icon(Icons.arrow_back)),
        title: Text(!controller.isEdit ? 'Tambah Dokter' : 'Ubah dokter'),
        actions: [
          IconButton(
            onPressed: () {
              !controller.isEdit ? controller.createDoctor() : controller.updateDoctor();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: GetBuilder<DoctorController>(
        init: controller,
        builder: (_) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
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
                    controller: controller.spesialis,
                    validator: (val) => Validation.required(val!),
                    decoration: InputDecoration(labelText: 'Spesialis'),
                  ),
                  SizedBox(height: 16),
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
                            groupValue: controller.jenisKelamin,
                            onChanged: (String? value) {
                              controller.changeJenisKelamin(value);
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
                            groupValue: controller.jenisKelamin,
                            onChanged: (String? value) {
                              controller.changeJenisKelamin(value);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  controller.jadwal.isEmpty
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jadwal dokter'),
                            Column(
                              children: List.generate(
                                controller.jadwal.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.setDataJadwal(index);
                                          Get.dialog(dialog(index: index));
                                        },
                                        child: Text(
                                          '- ${controller.jadwal[index].hari}, ${controller.jadwal[index].pukul!.buka} s/d ${controller.jadwal[index].pukul!.tutup}',
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.removeDay(index);
                                        },
                                        child: Icon(Icons.delete, color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.dialog(dialog());
                        },
                        icon: Icon(
                          Icons.add,
                        ),
                        label: Text('Tambah Jadwal'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
