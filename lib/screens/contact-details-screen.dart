// ignore_for_file: must_be_immutable

import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:contacts_app/widgets/bottom-app-bar.dart';
import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
  String contactName;
  String email;
  String phoneNumber;
  ContactDetailScreen(
      {super.key,
      required this.contactName,
      required this.email,
      required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: appcolor.backgroundColor,
          appBar: AppBar(
            backgroundColor: appcolor.backgroundColor,
            toolbarHeight: 30,
            iconTheme: IconThemeData(color: appcolor.primaryColor),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/person.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    contactName,
                    style: Fontstyles.HeadlineStyle0(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Phone Number Container
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: appcolor.unselectedColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          phoneNumber,
                          style: Fontstyles.ButtonText2(context),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone_rounded,
                              color: appcolor.buttonColor,
                            ))
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Email Container
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: appcolor.unselectedColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          email,
                          style: Fontstyles.ButtonText2(context),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.email_rounded,
                              color: appcolor.buttonColor,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBarWidget()),
    );
  }
}
