import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class HomeToggleButtonComponent extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final bool isSelected, isLeft;
  const HomeToggleButtonComponent(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.isSelected,
      required this.isLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onPressed,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: isSelected ? CustomColors.primary : Colors.grey[400],
            borderRadius: isLeft
                ? const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
          ),
          duration: const Duration(milliseconds: 300),
          child: Center(
            child: Text(
              title,
              style: CustomTextStyles.textSmallLight,
            ),
          ),
        ),
      ),
    );
  }
}
