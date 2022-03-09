import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/modules/home/components/home_header_component.dart';
import 'package:efficient_meeting_app/modules/home/components/tabbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeTabController _tabx = Get.put(HomeTabController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeHeaderComponent(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * .5,
              child: TabBarView(controller: _tabx.controller, children: [
                Container(),
                Container(),
              ]

                  // _tabx.myTabs.map((Tab tab) {
                  //   final String label = tab.text!.toLowerCase();
                  //   return Center(
                  //     child: Text(
                  //       'This is the $label tab',
                  //       style: const TextStyle(fontSize: 36),
                  //     ),
                  //   );
                  // }).toList(),

                  ),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: CustomColors.dark,
          controller: _tabx.controller,
          tabs: _tabx.myTabs,
        ),
      ),
    );
  }
}
