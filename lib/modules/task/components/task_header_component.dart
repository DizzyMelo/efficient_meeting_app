import 'package:flutter/material.dart';

import '../../../core/entities/user_entity.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';

class TaskHeaderComponent extends StatelessWidget {
  const TaskHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: CustomColors.accent1,
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            foregroundImage: AssetImage("assets/img/alien.png"),
          ),
          const SizedBox(height: 10),
          Text(
            User.user!.firstname,
            style: CustomTextStyles.textMedium,
          ),
          const SizedBox(height: 10),
          Text(
            '3 tasks pending',
            style: CustomTextStyles.textMedium,
          ),
        ],
      ),
    );
  }
}
