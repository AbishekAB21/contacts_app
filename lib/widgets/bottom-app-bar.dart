// ignore_for_file: must_be_immutable

import 'package:contacts_app/provider/db/database-provider.dart';
import 'package:contacts_app/widgets/reusable-alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:provider/provider.dart';

class BottomAppBarWidget extends StatelessWidget {
  String contactName;
  String phoneNumber;
  String email;

  BottomAppBarWidget({
    super.key,
    required this.contactName,
    required this.phoneNumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final nameCntrlr = TextEditingController(text: contactName);
    final phoneNumCntrlr = TextEditingController(text: phoneNumber);
    final emailCntrlr = TextEditingController(text: email);
    final _dbProvider = Provider.of<DatabaseProvider>(context);

    return BottomAppBar(
      height: 60,
      color: appcolor.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            highlightColor: appcolor.teritiaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ReusableAlertDialog(
                    nameCntrlr: nameCntrlr,
                    phoneNumCntrlr: phoneNumCntrlr,
                    emailCntrlr: emailCntrlr,
                    onSubmit: (updatedContactMap) {
                      _dbProvider.editContacts(
                          updatedContactMap, phoneNumber, context);
                    },
                    actionText: "Update",
                  );
                },
              );
            },
            icon: Icon(
              Icons.edit_rounded,
              color: appcolor.primaryColor,
            ),
          ),
          IconButton(
            highlightColor: appcolor.teritiaryColor,
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: appcolor.primaryColor,
            ),
          ),
          IconButton(
            highlightColor: appcolor.teritiaryColor,
            onPressed: () {
              _dbProvider.deleteContacts(phoneNumber, context);
            },
            icon: Icon(
              Icons.delete_rounded,
              color: appcolor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
