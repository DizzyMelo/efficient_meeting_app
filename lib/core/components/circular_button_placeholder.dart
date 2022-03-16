import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CircularButtonPlaceholderComponent extends StatelessWidget {
  final IconData icon;
  const CircularButtonPlaceholderComponent({Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.primary,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
