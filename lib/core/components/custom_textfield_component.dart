import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFieldComponent({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          validator: validator ?? GeneralUtils.defaultTextfieldValidator,
          style: CustomTextStyles.textMedium,
          decoration: InputDecoration(
            labelText: label,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.secondary,
                width: 2,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.accent1,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
