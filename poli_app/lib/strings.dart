import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/models/polyclinic/polyclinic_model.dart';

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
    gambar: 'assets/poliklinik/klinik kandungan.png',
  ),
  PolyclinicModel(
    nama: 'Klinik Bayi Dan Anak',
    gambar: 'assets/poliklinik/klinik anak.jpg',
  ),
  PolyclinicModel(
    nama: 'Klinik Bedah',
    gambar: 'assets/poliklinik/klinik bedah.jpg',
  ),
  PolyclinicModel(
    nama: 'Klinik Gigi Dan Mulut',
    gambar: 'assets/poliklinik/klinik gigi dan mulut.png',
  ),
  PolyclinicModel(
    nama: 'Klinik Neurologi',
    gambar: 'assets/poliklinik/klinik neurologi.png',
  ),
  PolyclinicModel(
    nama: 'Klinik Penyakit Dalam',
    gambar: 'assets/poliklinik/klinik penyakit dalam.png',
  ),
  PolyclinicModel(
    nama: 'Klinik THT',
    gambar: 'assets/poliklinik/klinik tht.jpg',
  ),
  PolyclinicModel(
    nama: 'Klinik Mata',
    gambar: 'assets/poliklinik/klinik mata.jpg',
  ),
  PolyclinicModel(
    nama: 'Klinik Jantung',
    gambar: 'assets/poliklinik/klinik jantung.jpg',
  ),
  PolyclinicModel(
    nama: 'Klinik Umum',
    gambar: 'assets/poliklinik/klinik umum.jpg',
  ),
  PolyclinicModel(
    nama: 'Klinik VCT',
    gambar: 'assets/poliklinik/klinik vct.jpg',
  ),
  PolyclinicModel(
    nama: 'Klinik Nyeri',
    gambar: 'assets/poliklinik/klinik nyeri.jpg',
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
