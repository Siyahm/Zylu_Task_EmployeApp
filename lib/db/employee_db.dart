import 'dart:developer';

import 'package:employee_app/model/emplotee_model.dart';
import 'package:hive_flutter/adapters.dart';

class EmployeeDB {
  Future<bool> addEmployee(EmployeeModel model) async {
    try {
      final employeeDb = await Hive.openBox<EmployeeModel>('EMPLOYEE_DB');
      await employeeDb.put(model.id, model);
      log(employeeDb.toString());
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

  Future<void> deleteAllEmployee() async {
    await Hive.deleteBoxFromDisk('EMPLOYEE_DB');
  }

  Future<bool> deleteAnEmployee(EmployeeModel model) async {
    try {
      final employeeDb = await Hive.openBox<EmployeeModel>('EMPLOYEE_DB');
      await employeeDb.delete(model.id);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
