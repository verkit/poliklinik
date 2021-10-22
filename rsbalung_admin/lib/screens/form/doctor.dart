import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/models/doctor/doctor_model.dart';
import 'package:rsbalung_admin/services/firestore.dart';
import 'package:rsbalung_admin/validator.dart';

class FormDoctorScreen extends StatefulWidget {
  const FormDoctorScreen({Key? key, required this.isEdit, this.data}) : super(key: key);
  final bool isEdit;
  final DoctorModel? data;

  @override
  State<FormDoctorScreen> createState() => _FormDoctorScreenState();
}

class _FormDoctorScreenState extends State<FormDoctorScreen> {
  TextEditingController buka = TextEditingController(), tutup = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController spesialis = TextEditingController();
  var formJadwalKey = GlobalKey<FormState>();
  final FirestoreService repository = FirestoreService();

  //* Bagian detail
  DoctorModel selectedDoctor = DoctorModel();
  String? jenisKelamin;
  List<Jadwal> jadwal = [];

  List<String>? days = ['senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu', 'minggu'];

  changeJenisKelamin(String? value) {
    setState(() {
      jenisKelamin = value;
    });
  }

  removeDay(int index) {
    setState(() {
      jadwal.removeAt(index);
    });
  }

  var formKey = GlobalKey<FormState>();
  createDoctor() {
    if (formKey.currentState!.validate()) {
      DoctorModel data = DoctorModel(
        nama: nama.text,
        dokter: spesialis.text,
        jenisKelamin: jenisKelamin,
        jadwal: jadwal,
      );
      repository.createDoctor(data);
      clearForm();
      Get.back(result: true);
    }
  }

  updateDoctor() {
    if (formKey.currentState!.validate()) {
      selectedDoctor.nama = nama.text;
      selectedDoctor.dokter = spesialis.text;
      selectedDoctor.jenisKelamin = jenisKelamin;
      selectedDoctor.jadwal = jadwal;
      repository.updateDoctor(selectedDoctor.id!, selectedDoctor);
      Get.back(result: true);
      clearForm();
    }
  }

  void onBack() {
    clearForm();
    jenisKelamin = null;
    Get.back(result: true);
  }

  clearForm() {
    nama.clear();
    spesialis.clear();
    buka.clear();
    tutup.clear();
    jadwal.clear();
  }

  setData(DoctorModel data) async {
    selectedDoctor = await repository.getDoctor(data.id!);
    nama.text = selectedDoctor.nama!;
    spesialis.text = selectedDoctor.dokter!;
    jenisKelamin = selectedDoctor.jenisKelamin!;
    jadwal = selectedDoctor.jadwal!;
    setState(() {});
  }

  String? day;
  setDataJadwal(int i) {
    day = jadwal[i].hari;
    buka.text = jadwal[i].pukul!.buka!;
    tutup.text = jadwal[i].pukul!.tutup!;
    setState(() {});
  }

  @override
  void initState() {
    if (widget.data != null) {
      setData(widget.data!);
    }

    super.initState();
  }

  @override
  void dispose() {
    nama.dispose();
    spesialis.dispose();
    buka.dispose();
    tutup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget dialog(StateSetter setInnerState, {int? index}) => SimpleDialog(
          contentPadding: EdgeInsets.all(16),
          title: Text('Jadwal dokter'),
          children: [
            Form(
              key: formJadwalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButton<String>(
                    hint: Text('Pilih hari'),
                    value: day,
                    elevation: 16,
                    onChanged: (var val) {
                      day = val;
                      setInnerState(() {});
                    },
                    isExpanded: true,
                    items: days?.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  day == null
                      ? Text(
                          'Harus diisi',
                          style: TextStyle(color: Colors.red),
                        )
                      : SizedBox(),
                  TextFormField(
                    controller: buka,
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
                    controller: tutup,
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
                      if (formJadwalKey.currentState!.validate()) {
                        if (index != null) {
                          jadwal[index].hari = day;
                          jadwal[index].pukul = Pukul(buka: buka.text, tutup: tutup.text);
                        } else {
                          jadwal.add(Jadwal(hari: day, pukul: Pukul(buka: buka.text, tutup: tutup.text)));
                        }
                        setState(() {});
                        Get.back(result: true);
                        buka.clear();
                        tutup.clear();
                      }
                    },
                    child: Text('Simpan'),
                  )
                ],
              ),
            )
          ],
        );

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: onBack, icon: Icon(Icons.arrow_back)),
          title: Text(!widget.isEdit ? 'Tambah Dokter' : 'Ubah dokter'),
          actions: [
            IconButton(
              onPressed: () {
                !widget.isEdit ? createDoctor() : updateDoctor();
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nama,
                  validator: (val) => Validation.required(val!),
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextFormField(
                  controller: spesialis,
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
                          groupValue: jenisKelamin,
                          onChanged: (String? value) {
                            changeJenisKelamin(value);
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
                          groupValue: jenisKelamin,
                          onChanged: (String? value) {
                            changeJenisKelamin(value);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                jadwal.isEmpty
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jadwal dokter'),
                          Column(
                            children: List.generate(
                              jadwal.length,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setDataJadwal(index);
                                        showDialog(
                                          builder: (ctx) =>
                                              StatefulBuilder(builder: (context, StateSetter setInnerState) {
                                            return dialog(setInnerState, index: index);
                                          }),
                                          context: context,
                                        );
                                      },
                                      child: Text(
                                        '- ${jadwal[index].hari}, ${jadwal[index].pukul!.buka} s/d ${jadwal[index].pukul!.tutup}',
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        removeDay(index);
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
                        showDialog(
                          builder: (ctx) => StatefulBuilder(builder: (context, StateSetter setInnerState) {
                            return dialog(setInnerState);
                          }),
                          context: context,
                        );
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
        ));
  }
}
