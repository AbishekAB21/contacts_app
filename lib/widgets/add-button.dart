import 'package:contacts_app/provider/db/database-provider.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:contacts_app/widgets/reusable-snackbar.dart';
import 'package:contacts_app/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCntrlr = TextEditingController();
    TextEditingController emailCntrlr = TextEditingController();
    TextEditingController phoneNumCntrlr = TextEditingController();

    final _dbProvider = Provider.of<DatabaseProvider>(context);

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: appcolor.unselectedColor,
              content: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 400, maxWidth: 500),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Add new contact",
                      style: Fontstyles.HeadlineStyle2(context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableTextfield(
                        prefixicon: Icon(Icons.person),
                        title: "Name",
                        cntrlr: nameCntrlr,
                        isObscure: false),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableTextfield(
                        prefixicon: Icon(Icons.phone_rounded),
                        title: "Phone number",
                        cntrlr: phoneNumCntrlr,
                        isObscure: false),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableTextfield(
                        prefixicon: Icon(Icons.email_rounded),
                        title: "Email",
                        cntrlr: emailCntrlr,
                        isObscure: false),
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
                        _dbProvider.addContacts(contactsMap, context);
                        nameCntrlr.clear();
                        emailCntrlr.clear();
                        phoneNumCntrlr.clear();
                      } else {
                        ReusableSnackbar().showSnackbar(context,
                            "Please fill all the fields", appcolor.errorColor);
                      }
                    },
                    child: Text(
                      "Add",
                      style: Fontstyles.ContentTextStyle(context),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: Fontstyles.ContentTextStyle(context),
                    )),
              ],
            );
          },
        );
      },
      backgroundColor: appcolor.buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Icon(
        Icons.add_rounded,
        color: appcolor.primaryColor,
      ),
    );
  }
}
