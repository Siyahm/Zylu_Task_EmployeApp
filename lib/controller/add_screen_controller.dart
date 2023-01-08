import 'dart:developer';

import 'package:employee_app/db/employee_db.dart';
import 'package:employee_app/helpers/app_colors.dart';
import 'package:employee_app/model/emplotee_model.dart';
import 'package:employee_app/utils/custom_snack_bar.dart';
import 'package:employee_app/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreenController with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  Status status = Status.active;
  DateTime? selectedDate;

  void changeRadioValue(Status newValue) {
    status = newValue;
    notifyListeners();
  }

  Future<void> showDate(context) async {
    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (result != null) {
      log(result.toString());
      selectedDate = result;
      dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate!);
      notifyListeners();
    }
  }

  void clearControllers() {
    nameController.clear();
    dateController.clear();
    selectedDate = null;
    status = Status.active;
    notifyListeners();
  }

  void addEmployee(BuildContext context) async {
    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    EmployeeDB()
        .addEmployee(
      EmployeeModel(
        name: nameController.text,
        date: selectedDate!,
        status: status,
        id: id,
      ),
    )
        .then(
      (value) {
        if (value == true) {
          customSnackBar(
              context, 'Added Employee successfully', AppColors.greenColor);
          clearControllers();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
    log('date formated');
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  String? dateValidations(String? value) {
    if (value!.isEmpty) {
      return 'Please select date';
    } else {
      return null;
    }
  }
}
