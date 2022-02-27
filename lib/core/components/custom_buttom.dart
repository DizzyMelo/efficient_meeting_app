import 'package:efficient_meeting_app/core/colors.dart';
import 'package:efficient_meeting_app/core/components/loading_component.dart';
import 'package:efficient_meeting_app/core/fonts.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String title;
  final bool loading;
  final Function()? function;

  const CustomButtom(
      {Key? key, required this.title, this.function, this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 300),
        height: 50,
        width: loading ? 50 : 200,
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? const LoadingComponent()
              : Text(
                  title,
                  style: CustomTextStyles.button,
                ),
        ),
      ),
    );
  }
}