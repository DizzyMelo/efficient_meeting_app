import 'package:efficient_meeting_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final String label;

  const CustomTextFieldComponent({Key? key, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
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
