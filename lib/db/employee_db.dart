import 'dart:developer';

import 'package:employee_app/model/emplotee_model.dart';
import 'package:hive_flutter/adapters.dart';

class EmployeeDB {
  Future<bool> addEmployee(EmployeeModel model) async {
    try {
      final employeeDb = await Hive.openBox<EmployeeModel>('EMPLOYEE_DB');
      await employeeDb.add(model);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<EmployeeModel?>> getEmployee() async {
    final employeeDb = await Hive.openBox<EmployeeModel>('EMPLOYEE_DB');
    return employeeDb.values.toList();
  }
}
