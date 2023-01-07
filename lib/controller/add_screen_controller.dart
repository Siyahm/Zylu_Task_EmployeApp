import 'package:flutter/cupertino.dart';

class AddScreenController with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  Status status = Status.active;

  final List employeeList = [];

  void changeRadioValue(Status newValue) {
    status = newValue;
    notifyListeners();
  }
}

enum Status {
  active,
  inactive,
}
