import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CircularButtonComponent extends StatelessWidget {
  final Function function;
  final IconData icon;
  const CircularButtonComponent(
      {Key? key, required this.function, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
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
      ),
    );
  }
}
