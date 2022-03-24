import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/entities/user_entity.dart';
import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/modules/participants/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class AddParticipantView extends GetView<AddParticipantController> {
  final String? meetingId;
  AddParticipantView({Key? key, this.meetingId = ''}) : super(key: key);
  final userTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('ID DO MMEETINF');
    print(meetingId);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Add Participant'),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      autofocus: true,
                      style: CustomTextStyles.textMedium,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          border: UnderlineInputBorder(),
                          suffixIcon: Icon(Icons.person_add_alt_1)),
                    ),
                    suggestionsCallback: (pattern) async {
                      return await controller.getUsersByText(email: pattern);
                    },
                    itemBuilder: (context, user) {
                      User u = user as User;
                      return ListTile(
                        onTap: () =>
                            addParticipantToMeeting(context, user, controller),
                        leading: CircleAvatar(
                          backgroundColor: CustomColors.accent1,
                          child: Center(
                            child: Text(
                              u.firstname.substring(0, 1),
                              style: CustomTextStyles.textLargeRegular,
                            ),
                          ),
                        ),
                        title: Text("${u.firstname} ${u.lastname}"),
                        subtitle: Text(u.email),
                      );
                    },
                    onSuggestionSelected: (suggestion) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addParticipantToMeeting(BuildContext context, User participant,
      AddParticipantController controller) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${participant.firstname} ${participant.lastname}',
                    style: CustomTextStyles.textMedium,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => CustomButtom(
                      loading: controller.loadingParticipant.value,
                      width: 250,
                      title: 'Add ${participant.firstname} to Meeting',
                      function: () => controller.addParticipantToMeeting(
                          meetingId!, participant.id),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
