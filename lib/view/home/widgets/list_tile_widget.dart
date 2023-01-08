import 'package:employee_app/controller/home_controller.dart';
import 'package:employee_app/helpers/app_colors.dart';
import 'package:employee_app/model/emplotee_model.dart';
import 'package:employee_app/utils/alert_dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    homeController.checkExperience(index);
    // log('listTile building');

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: homeController.setActiveColor(index),
        radius: 25,
        child: CircleAvatar(
          backgroundColor: AppColors.whiteColor,
          radius: 23,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              color: homeController.setActiveColor(index),
            ),
          ),
        ),
      ),
      title: Text(
        homeController.employeeList[index]!.name!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: homeController.setActiveColor(index),
        ),
      ),
      subtitle: Row(
        children: [
          Text(DateFormat('dd-MM-yyyy')
              .format(homeController.employeeList[index]!.date)
              .toString()),
          const Spacer(),
          Text(
            homeController.employeeList[index]!.status == Status.active
                ? 'Active'
                : 'Inactive',
            style: TextStyle(
              color: homeController.setActiveColor(index),
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          AlertDialogWidget().alertBox(context, () {
            homeController.deletAnEmployee(index, context);
            Navigator.pop(context);
          });
        },
      ),
    );
  }
}
