import 'package:employee_app/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget {
  void alertBox(BuildContext context, void Function()? onTap) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Data will be deleted',
          style: TextStyle(
            color: AppColors.redColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onTap,
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
