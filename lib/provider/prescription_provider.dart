import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:voicepres/prescription_model.dart';

class PrescriptionProvider extends ChangeNotifier {
  static Prescription instance;

  void initPres() {
    instance = new Prescription();
    var now = DateTime.now();
    instance.id = int.parse("${now.minute}${now.hour}${now.day}");
    print("New Prescription Created : ${instance.id}");
  }

  void addData(String section, String data) {
    switch (section) {
      case "personal":
        instance.personalDetails = data ?? "rem";
        break;

      case "diagnosis":
        instance.diagnosis = data ?? "rem";
        break;

      case "prescription":
        instance.prescription = data ?? "rem";
        break;

      case "advice":
        instance.advice = data ?? "rem";
        break;

      case "remarks":
        instance.remarks = data;
        break;
    }
  }

  void clear() {
    instance = null;
  }

  Future<String> generate() async {
    instance.createdOn = DateTime.now();
    print("Prescription Generated with\n");
    print(instance.id);
    print(instance.personalDetails);
    print(instance.diagnosis);
    print(instance.prescription);
    print(instance.advice);
    print(instance.remarks);
    print(instance.createdOn);
    String p = await pdf();
    return p;
  }

  Future<String> pdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(children: [
              pw.Container(
                child: pw.Text("Doctor Details"),
              ),
              pw.Table(children: [
                pw.TableRow(children: [
                  pw.Text("Personal Details:\t"),
                  pw.Text(instance.personalDetails)
                ]),
                pw.TableRow(children: [
                  pw.Text("Diagnosis:\t"),
                  pw.Text(instance.diagnosis)
                ]),
                pw.TableRow(children: [
                  pw.Text("Prescription:\t"),
                  pw.Text(instance.prescription)
                ]),
                pw.TableRow(
                    children: [pw.Text("Advice:\t"), pw.Text(instance.advice)]),
                pw.TableRow(children: [
                  pw.Text("Remarks:\t"),
                  pw.Text(instance.remarks)
                ]),
                pw.TableRow(children: [
                  pw.Text("Created by NJ on:\t"),
                  pw.Text(instance.createdOn.toString())
                ]),
                pw.TableRow(children: [
                  pw.Text("ID:\t"),
                  pw.Text(instance.id.toString())
                ])
              ])
            ]),
          ); // Center
        }));

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/${instance.id}.pdf");

    await file.writeAsBytes(pdf.save());

    return "${output.path}/${instance.id}.pdf";
  }
}
