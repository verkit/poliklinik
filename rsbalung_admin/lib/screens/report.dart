import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:rsbalung_admin/models/check/check_model.dart';
import 'package:rsbalung_admin/services/auth.dart';
import 'package:rsbalung_admin/services/firestore.dart';
import 'package:rsbalung_admin/snackbar.dart';
import 'package:rsbalung_admin/strings.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  List<CheckModel> checks = [];

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        var f = DateFormat('dd-MM-yyyy');
        date = f.format(selectedDate);
      });
    }
  }

  Future<List<PolyReport>> _getChecks(DateTime date) async {
    checks = await FirestoreService().getChecks(date: date);
    List<PolyReport> _reports = [];
    var role = await AuthFirebase.getRole();
    print(role);
    if (role == 'pendaftaran') {
      for (var i = 1; i < poliklinik.length; i++) {
        var _checks = checks.where((element) => element.dokter!.poliklinik == poliklinik[i].nama).toList();
        var man = _checks.where((element) => element.pasien!.jenisKelamin == 'L').toList();
        print(poliklinik[i].nama! + ': ' + _checks.length.toString());
        _reports.add(
          PolyReport(
            name: poliklinik[i].nama,
            man: man.length,
            woman: _checks.length - man.length,
            total: _checks.length,
          ),
        );
      }
    } else {
      var man = checks.where((element) => element.pasien!.jenisKelamin == 'L').toList();

      _reports.add(
        PolyReport(
          name: role,
          man: man.length,
          woman: checks.length - man.length,
          total: checks.length,
        ),
      );
    }
    setState(() {});
    return _reports;
  }

  _print() async {
    EasyLoading.show();
    final pdf = pw.Document();
    if (date.isNotEmpty) {
      await _getChecks(selectedDate).then((reports) async {
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Table(
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text('No'),
                      pw.Text('Klinik'),
                      pw.Text('Laki'),
                      pw.Text('Perempuan'),
                      pw.Text('Total'),
                    ],
                  ),
                  ...List.generate(reports.length, (index) {
                    return pw.TableRow(
                      children: [
                        pw.Text('${index + 1}'),
                        pw.Text(reports[index].name!),
                        pw.Text(reports[index].man!.toString()),
                        pw.Text(reports[index].woman!.toString()),
                        pw.Text(reports[index].total!.toString()),
                      ],
                    );
                  }),
                ],
              );
            },
          ),
        );

        await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
        setState(() {});
      });
    } else {
      Snackbar.warning('Harap isi tanggal');
    }
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cetak Laporan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tanggal"),
            TextButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text(date.isEmpty ? 'Pilih tanggal' : date),
            ),
            ElevatedButton.icon(
              label: Text('Cetak'),
              onPressed: () async {
                _print();
              },
              icon: Icon(Icons.print),
            ),
          ],
        ),
      ),
    );
  }
}

class PolyReport {
  final String? name;
  final int? man;
  final int? woman;
  final int? total;

  PolyReport({
    required this.name,
    required this.man,
    required this.woman,
    required this.total,
  });
}
