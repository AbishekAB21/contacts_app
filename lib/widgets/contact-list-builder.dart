import 'package:contacts_app/screens/contact-details-screen.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class ContactsListBuilder extends StatelessWidget {
  const ContactsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailScreen(),
                  ));
            },
            //dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            title: Text(
              'Nivi',
              style: Fontstyles.HeadlineStyle3(context),
            ),

            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/person.png"),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: appcolor.teritiaryColor);
        },
        itemCount: 20,
      ),
    );
  }
}
