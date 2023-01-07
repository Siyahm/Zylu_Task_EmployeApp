import 'package:employee_app/controller/add_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeStatusWidget extends StatelessWidget {
  const EmployeeStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addScreenController =
        Provider.of<AddScreenController>(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: Radio(
              value: Status.active,
              groupValue: addScreenController.status,
              onChanged: (newValue) {
                addScreenController.changeRadioValue(newValue!);
              },
            ),
            title: const Text('Active'),
          ),
        ),
        Expanded(
          child: ListTile(
            leading: Radio(
              value: Status.inactive,
              groupValue: addScreenController.status,
              onChanged: (newValue) {
                addScreenController.changeRadioValue(newValue!);
              },
            ),
            title: const Text('Inactive'),
          ),
        ),
      ],
    );
  }
}
