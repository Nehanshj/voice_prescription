import 'package:flutter/cupertino.dart';
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
        instance.personalDetails = data;
        break;

      case "diagnosis":
        instance.diagnosis = data;
        break;

      case "prescription":
        instance.prescription = data;
        break;

      case "advice":
        instance.advice = data;
        break;

      case "remarks":
        instance.remarks = data;
        break;
    }
  }

  void clear() {
    instance = null;
  }

  void generate() {
    instance.createdOn = DateTime.now();
    print("Prescription Generated with\n ${instance.toString()}");
    print(instance.id);
    print(instance.personalDetails);
    print(instance.diagnosis);
    print(instance.prescription);
    print(instance.advice);
    print(instance.remarks);
    print(instance.createdOn);
  }
}
