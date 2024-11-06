import 'package:contacts_app/screens/bottom-nav-bar.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:contacts_app/widgets/reusable-snackbar.dart';
import 'package:contacts_app/widgets/reusable_textfield.dart';

class ReusableAlertDialog extends StatelessWidget {
  final TextEditingController nameCntrlr;
  final TextEditingController phoneNumCntrlr;
  final TextEditingController emailCntrlr;
  final Function(Map<String, dynamic> contactMap) onSubmit;
  final String actionText;

  ReusableAlertDialog({
    super.key,
    required this.nameCntrlr,
    required this.phoneNumCntrlr,
    required this.emailCntrlr,
    required this.onSubmit,
    this.actionText =
        "Add", // Defaults to "Add", can be set to "Update" for edit mode
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appcolor.unselectedColor,
      content: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 400, maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Text(
              actionText == "Add" ? "Add new contact" : "Edit contact",
              style: Fontstyles.HeadlineStyle2(context),
            ),
            SizedBox(height: 20),
            ReusableTextfield(
              prefixicon: Icon(Icons.person),
              title: "Name",
              cntrlr: nameCntrlr,
              isObscure: false,
            ),
            SizedBox(height: 15),
            ReusableTextfield(
              prefixicon: Icon(Icons.phone_rounded),
              title: "Phone number",
              cntrlr: phoneNumCntrlr,
              isObscure: false,
            ),
            SizedBox(height: 15),
            ReusableTextfield(
              prefixicon: Icon(Icons.email_rounded),
              title: "Email",
              cntrlr: emailCntrlr,
              isObscure: false,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (nameCntrlr.text.isNotEmpty &&
                phoneNumCntrlr.text.isNotEmpty &&
                emailCntrlr.text.isNotEmpty) {
              Map<String, dynamic> contactsMap = {
                "name": nameCntrlr.text,
                "phone": phoneNumCntrlr.text,
                "email": emailCntrlr.text,
              };
              onSubmit(contactsMap);
              Navigator.pop(context);
              ReusableSnackbar().showSnackbar(
                context,
                "Updated Contact Successfully",
                appcolor.successColor,
              );
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBar(),
                  ));
            } else {
              ReusableSnackbar().showSnackbar(
                context,
                "Please fill all the fields",
                appcolor.errorColor,
              );
            }
          },
          child: Text(
            actionText,
            style: Fontstyles.ContentTextStyle(context),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: Fontstyles.ContentTextStyle(context),
          ),
        ),
      ],
    );
  }
}
