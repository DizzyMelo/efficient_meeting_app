import 'package:efficient_meeting_app/core/api/response/meeting/meetings_response_model.dart';
import 'package:efficient_meeting_app/modules/home/binding.dart';
import 'package:efficient_meeting_app/modules/home/view.dart';
import 'package:efficient_meeting_app/modules/meeting/add/binding.dart';
import 'package:efficient_meeting_app/modules/meeting/add/view.dart';
import 'package:efficient_meeting_app/modules/signup/binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'core/theme/colors.dart';
import 'modules/login/binding.dart';
import 'modules/login/view.dart';
import 'modules/meeting/details/binding.dart';
import 'modules/meeting/details/detail_meeting_view.dart';
import 'modules/signup/view.dart';

void main() async {
  await dotenv.load(fileName: "config.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Efficient Meeting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CustomColors.themeColor,
        // textTheme: GoogleFonts.latoTextTheme(
        //   Theme.of(context)
        //       .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        // ),
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
            name: '/login', page: () => LoginView(), binding: LoginBiding()),
        GetPage(
            name: '/signup', page: () => SignupView(), binding: SignupBiding()),
        GetPage(name: '/home', page: () => HomeView(), binding: HomeBiding()),
        GetPage(
            name: '/add-meeting',
            page: () => AddMeetingView(),
            binding: AddMeetingBiding()),
        GetPage(
            name: '/meeting-detail',
            page: () => const DetailMeetingView(),
            binding: DetailMeetingBiding()),
      ],
    );
  }
}
