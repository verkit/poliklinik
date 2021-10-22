import 'package:rsbalung_admin/models/doctor/doctor_model.dart';

import 'models/polyclinic/polyclinic_model.dart';

String profileRs =
    'Rumah Sakit Daerah Balung adalah rumah sakit dengan kelas tipe C milik pemerintah kabupaten Jember, terletak di Kabupaten Jember bagian selatan. Dilengkapi fasilitas rawat jalan/Dokter Spesialis spesialis yang representatif dilengkapi fasilitas rawat inap yang representatif dan didukung fasilitas penunjang medis untuk membantu menegakkan diagnosa penyakit juga didukung instalasi farmasi yang menyediakan obat dan peralatan yang dibutuhkan serta didukung fasilitas instalasi bedah sentral/kamar operasi yang representatif. Sebagai institusi pelayanan kesehatan, Rumah Sakit Umum Daerah Balung diresmikan sebagai rumah sakit kelas C oleh Bupati Jember pada awal mellineum II tanggal 2 Januari 2002.';

String address = 'Jalan Rambipuji No.19 Gumelar, Kebonsari, Balung Lor, Balung, Kabupaten Jember, Jawa Timur 68161';
String phone = '(0336) 621595';
String email = 'balunghospital@gmail.com';

List<String> payments = [
  'umum',
  'bpjs',
  'jasaraharja',
  'asuransi lainnya',
  'spm dinsos',
  'jampersal',
  'bpjs ketenagakerjaan'
];

List<String> jenisKelamin = [
  'L',
  'P',
];

List<PolyclinicModel> poliklinik = [
  PolyclinicModel(nama: 'pendaftaran'),
  PolyclinicModel(
    nama: 'Poliklinik Kebidanan dan Kandungan',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20kandungan.png?alt=media&token=c87c250c-b438-4b24-9ca2-5d4ecbd20d8c',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Anak',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20anak.jpg?alt=media&token=9a42fcba-2c99-4c41-b409-b34a23f4e69a',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Bedah',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20bedah.jpg?alt=media&token=964fb39b-8fdc-4ed5-9af8-bfa5b1e2db0a',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Gigi',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20gigi%20dan%20mulut.png?alt=media&token=80daa5c6-234e-42e3-8181-7ccb83b8925c',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Penyakit Dalam',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20penyakit%20dalam.png?alt=media&token=84ba3520-151a-42df-8afc-3339bbffd9d1',
  ),
  PolyclinicModel(
    nama: 'Poliklinik THT',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20tht.jpg?alt=media&token=e065238e-8a2b-4026-95a9-11ce664f4eff',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Mata',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20mata.jpg?alt=media&token=90765172-d358-47df-bf8b-f7458c9fc28b',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Radiologi',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20jantung.jpg?alt=media&token=86cf0475-ecd8-4a57-b89c-1045404d736a',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Patologi',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20umum.jpg?alt=media&token=191da0f1-fb55-4cbb-b3c2-c86e1e210e09',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Anastesi',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20vct.jpg?alt=media&token=43cc558b-76d3-40a6-82ac-d29f5f855b1d',
  ),
  PolyclinicModel(
    nama: 'Poliklinik Orthopedi',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20nyeri.jpg?alt=media&token=03000014-0f1a-441c-a954-7547ed7b49d2',
  ),
];

List<DoctorModel> doctors = [
  DoctorModel(
    nama: 'dr. Moch. Sodiq Kukuh Worosanyoto, Sp.OG',
    dokter: 'Dokter Spesialis Kebidanan & Kandungan',
    poliklinik: 'Poliklinik Kebidanan dan Kandungan',
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Ryan Ibrahim, Sp.OG',
    dokter: 'Dokter Spesialis Kebidanan & Kandungan',
    poliklinik: 'Poliklinik Kebidanan dan Kandungan',
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "18.00", tutup: "20.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "18.00", tutup: "20.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. H. M. Arief Heriawan, Sp.B, Finac ',
    dokter: 'Dokter Spesialis Bedah',
    poliklinik: 'Poliklinik Bedah',
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Laksmi Indreswari, Sp.B',
    dokter: 'Dokter Spesialis Bedah',
    poliklinik: 'Poliklinik Bedah',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "08.30", tutup: "20.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "08.30", tutup: "20.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "08.30", tutup: "20.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "08.30", tutup: "20.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "08.30", tutup: "20.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "08.30", tutup: "20.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. H. Agus Yudho Santoso , Sp.PD, Finasim',
    dokter: 'Dokter Spesialis Penyakit Dalam',
    poliklinik: 'Poliklinik Penyakit Dalam',
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Astu Anindya Jati, Sp.PD',
    dokter: 'Dokter Spesialis Penyakit Dalam',
    poliklinik: 'Poliklinik Penyakit Dalam',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "senin", pukul: Pukul(buka: "18.00", tutup: "20.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "18.00", tutup: "20.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Jualita Heidy Saputri, Sp.PD',
    dokter: 'Dokter Spesialis Penyakit Dalam',
    poliklinik: 'Poliklinik Penyakit Dalam',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "senin", pukul: Pukul(buka: "14.30", tutup: "17.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "14.30", tutup: "17.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "14.30", tutup: "17.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "14.30", tutup: "17.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "14.30", tutup: "17.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "14.30", tutup: "17.00")),
    ],
  ),
  DoctorModel(
    nama: 'drg. H. Gandhi Rijanto, Ortho',
    dokter: 'Dokter Spesialis Orthopedi',
    poliklinik: 'Poliklinik Gigi',
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Heni Wijayanti, Sp.M',
    dokter: 'Dokter Spesialis Mata',
    poliklinik: 'Poliklinik Mata',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Natalia Kristanti Nugraheni, Sp.A',
    dokter: 'Dokter Spesialis Anak',
    poliklinik: 'Poliklinik Anak',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Dini Fitrilia, Sp.THT - KL',
    dokter: 'Dokter Spesialis THT',
    poliklinik: 'Poliklinik THT',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. IGB Indra Angganugraha, M.BIOMED, Sp.OT',
    dokter: 'Dokter Spesialis Orthopedi',
    poliklinik: 'Poliklinik Orthopedi',
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Erfan Efendi, Sp.An',
    dokter: 'Dokter Spesialis Anastesi',
    poliklinik: 'Poliklinik Anastesi',
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Ade Rochaeni, Sp.PK',
    dokter: 'Dokter Spesialis Patologi Klinik',
    poliklinik: 'Poliklinik Patologi',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Aniek Rachmawati, Sp.Rad',
    dokter: 'Dokter Spesialis Radiologi',
    poliklinik: 'Poliklinik Radiologi',
    jenisKelamin: 'P',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "rabu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "jumat", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
];
