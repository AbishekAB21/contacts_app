import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:contacts_app/widgets/add-button.dart';
import 'package:contacts_app/widgets/contact-list-builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Contacts",
                    style: Fontstyles.HeadlineStyle1(context),
                  )),
              SizedBox(height: 20),

              // Contact
              ContactsListBuilder()
            ],
          ),
        ),

        // Add Button
        floatingActionButton: AddButton()
      ),
    );
  }
}
