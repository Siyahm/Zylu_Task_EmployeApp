import 'package:employee_app/controller/add_screen_controller.dart';
import 'package:employee_app/model/emplotee_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeStatusWidget extends StatelessWidget {
  const EmployeeStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddScreenController>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Radio(
                value: Status.active,
                groupValue: value.status,
                onChanged: (newValue) {
                  value.changeRadioValue(newValue!);
                },
              ),
              title: const Text('Active'),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Radio(
                value: Status.inactive,
                groupValue: value.status,
                onChanged: (newValue) {
                  value.changeRadioValue(newValue!);
                },
              ),
              title: const Text('Inactive'),
            ),
          ),
        ],
      ),
    );
  }
}
