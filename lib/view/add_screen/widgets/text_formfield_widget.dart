import 'package:employee_app/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.onTap,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        label: Text(
          label,
          style: const TextStyle(
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
