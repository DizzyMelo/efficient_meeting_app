import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool isObscure;
  final bool isProtected;
  final TextInputType inputType;
  final TextCapitalization capitalization;
  final Function()? toggleObscureText;

  const CustomTextFieldComponent({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.isObscure = false,
    this.isProtected = false,
    this.toggleObscureText,
    this.inputType = TextInputType.text,
    this.capitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          textCapitalization: capitalization,
          keyboardType: inputType,
          obscureText: isObscure,
          controller: controller,
          maxLines: maxLines,
          validator: validator ?? GeneralUtils.defaultTextfieldValidator,
          style: CustomTextStyles.textMedium,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: toggleObscureText != null
                ? IconButton(
                    onPressed: toggleObscureText,
                    icon: isObscure
                        ? const Icon(LineIcons.eye)
                        : const Icon(LineIcons.eyeSlash))
                : null,
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
