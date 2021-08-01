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
  'Pria',
  'Wanita',
];

List<PolyclinicModel> poliklinik = [
  PolyclinicModel(
    nama: 'Klinik Hamil Dan Kandungan',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20kandungan.png?alt=media&token=445cb093-ef3f-43a4-bf2b-020581a31971',
  ),
  PolyclinicModel(
    nama: 'Klinik Bayi Dan Anak',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20anak.jpg?alt=media&token=079a2319-ae3d-429d-818f-8e625617fd1c',
  ),
  PolyclinicModel(
    nama: 'Klinik Bedah',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20bedah.jpg?alt=media&token=f7945665-9b76-499c-a1ee-0deac171eef6',
  ),
  PolyclinicModel(
    nama: 'Klinik Gigi Dan Mulut',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20gigi%20dan%20mulut.png?alt=media&token=d89583c8-4d62-4a91-ad7f-5a311dcb6cb1',
  ),
  PolyclinicModel(
    nama: 'Klinik Neurologi',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20neurologi.png?alt=media&token=c06f45e5-2a87-4a48-81fb-d154068eb6b3',
  ),
  PolyclinicModel(
    nama: 'Klinik Penyakit Dalam',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20penyakit%20dalam.png?alt=media&token=45b2a984-d2ef-456d-847f-a328e22f47f9',
  ),
  PolyclinicModel(
    nama: 'Klinik THT',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20tht.jpg?alt=media&token=adebd699-2312-425f-b1a5-7e96b4ce6801',
  ),
  PolyclinicModel(
    nama: 'Klinik Mata',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20mata.jpg?alt=media&token=b9b5c66f-697d-4e6b-83f6-f087f8c9c447',
  ),
  PolyclinicModel(
    nama: 'Klinik Jantung',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20jantung.jpg?alt=media&token=0c133c28-6ac2-43a8-9d13-d7e1f3dce8f5',
  ),
  PolyclinicModel(
    nama: 'Klinik Umum',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20umum.jpg?alt=media&token=736a6156-53cb-45d0-b189-977d95df9b40',
  ),
  PolyclinicModel(
    nama: 'Klinik VCT',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20vct.jpg?alt=media&token=ccaaee7f-5a44-49ba-a90b-dd82ddd9cb1e',
  ),
  PolyclinicModel(
    nama: 'Klinik Nyeri',
    gambar:
        'https://firebasestorage.googleapis.com/v0/b/rsd-balung.appspot.com/o/poliklinik%2Fklinik%20nyeri.jpg?alt=media&token=883eede5-429c-4d43-8d65-55eb7c3516ff',
  ),
];

List<DoctorModel> doctors = [
  DoctorModel(
    nama: 'dr. Moch. Sodiq Kukuh Worosanyoto, Sp.OG',
    dokter: 'Dokter Spesialis Kebidanan & Kandungan',
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
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "senin", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "selasa", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Astu Anindya Jati, Sp.PD',
    dokter: 'Dokter Spesialis Penyakit Dalam',
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
    jenisKelamin: 'L',
    jadwal: [
      Jadwal(hari: "kamis", pukul: Pukul(buka: "07.00", tutup: "14.00")),
      Jadwal(hari: "sabtu", pukul: Pukul(buka: "07.00", tutup: "14.00")),
    ],
  ),
  DoctorModel(
    nama: 'dr. Erfan Efendi, Sp.An',
    dokter: 'Dokter Spesialis Anastesi',
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
