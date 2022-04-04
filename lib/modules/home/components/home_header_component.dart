import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/entities/user_entity.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';

class HomeHeaderComponent extends StatelessWidget {
  const HomeHeaderComponent({Key? key}) : super(key: key);

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
          InkWell(
            onTap: () => displayUser(context),
            child: const CircleAvatar(
              radius: 50,
              foregroundImage: AssetImage("assets/img/alien.png"),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            User.user!.firstname,
            style: CustomTextStyles.textMedium,
          ),
          const SizedBox(height: 10),
          const RatingStars(
            value: 4.5,
            starCount: 5,
            starSize: 20,
            valueLabelVisibility: false,
          )
        ],
      ),
    );
  }

  displayUser(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 60,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () => Get.offAndToNamed('login'),
                    leading: const Icon(LineIcons.alternateLongArrowRight),
                    title: Text(
                      'Log out',
                      style: CustomTextStyles.textMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
