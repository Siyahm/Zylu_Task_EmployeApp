import 'package:employee_app/db/employee_db.dart';
import 'package:employee_app/model/emplotee_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  Duration? experience;
  List<EmployeeModel?> employeeList = [];

  void getAllEmployees() async {
    employeeList = await EmployeeDB().getEmployee();

    notifyListeners();
  }

  void checkExperience(int index) {
    experience = DateTime.now().difference(employeeList[index]!.date);
  }
}
