import 'package:employee_app/helpers/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        label: const Text(
          'Full Name',
          style: TextStyle(
            color: AppColors.greyColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.merge(
            const BorderSide(width: 0.5),
            const BorderSide(width: 0.5),
          ),
        ),
      ),
    );
  }
}
