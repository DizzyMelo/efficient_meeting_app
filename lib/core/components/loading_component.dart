import 'package:efficient_meeting_app/core/colors.dart';
import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation(CustomColors.secondary),
      ),
    );
  }
}
