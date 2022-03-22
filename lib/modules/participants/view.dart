import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/entities/user_entity.dart';
import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/modules/participants/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class AddParticipantView extends GetView<AddParticipantController> {
  AddParticipantView({Key? key}) : super(key: key);
  final userTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Add participant'),
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
                        // DefaultTextStyle.of(context)
                        //     .style
                        //     .copyWith(fontStyle: FontStyle.italic),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder())),
                    suggestionsCallback: (pattern) async {
                      return await controller.getUsersByText(email: pattern);
                    },
                    itemBuilder: (context, user) {
                      print(user);
                      return ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text('firstname'),
                        subtitle: Text('email'),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) =>
                      // ProductPage(product: suggestion)));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
