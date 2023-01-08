import 'package:employee_app/db/employee_db.dart';
import 'package:employee_app/helpers/app_colors.dart';
import 'package:employee_app/model/emplotee_model.dart';
import 'package:employee_app/utils/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  Duration? experience;
  List<EmployeeModel?> employeeList = [];

  Color setActiveColor(int index) {
    if (employeeList[index]!.status == Status.active &&
        experience!.inDays > 1825) {
      return AppColors.greenColor;
    } else {
      return AppColors.blackColor;
    }
  }

  void getAllEmployees() async {
    employeeList = await EmployeeDB().getEmployee();

    notifyListeners();
  }

  void checkExperience(int index) {
    experience = DateTime.now().difference(employeeList[index]!.date);
  }

  void deleteAllEmployees() async {
    await EmployeeDB().deleteAllEmployee();
    getAllEmployees();
    notifyListeners();
  }

  void deletAnEmployee(int index, BuildContext context) async {
    await EmployeeDB().deleteAnEmployee(employeeList[index]!).then((value) {
      if (value == true) {
        customSnackBar(
          context,
          'Employee Deleted Successfully',
          AppColors.greenColor,
        );
      } else {
        customSnackBar(
          context,
          "Something went wrong, Please try again",
          AppColors.redColor,
        );
      }
      getAllEmployees();
      notifyListeners();
    });
  }
}
