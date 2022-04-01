import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class DateTimeButtonComponent extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const DateTimeButtonComponent({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: CustomTextStyles.textSmall,
          ),
        ),
      ),
    );
  }
}
