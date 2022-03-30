import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/notification_header_component.dart';
import 'controller.dart';

class NotificationsView extends GetView<NotificationController> {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Notifications'),
        body: SingleChildScrollView(
          child: Column(
            children: const [NotificationsHeaderComponent()],
          ),
        ),
      ),
    );
  }
}
