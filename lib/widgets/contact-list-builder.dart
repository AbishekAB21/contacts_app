import 'package:contacts_app/provider/db/database-provider.dart';
import 'package:contacts_app/screens/contact-details-screen.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsListBuilder extends StatelessWidget {
  const ContactsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final _dbProvider = Provider.of<DatabaseProvider>(context);

    return StreamBuilder(
      stream: _dbProvider.getContactsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: appcolor.teritiaryColor,
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Something went wrong",
              style: Fontstyles.ContentTextStyle(context),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              "No Contacts",
              style: Fontstyles.ContentTextStyle(context),
            ),
          );
        }

        final contacts = snapshot.data!;

        return Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final contact = contacts[index];
              final contactName = contact['name'] ?? "Unknown";
              final phoneNumber = contact['phone'];
              final email = contact['email'];

              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetailScreen(
                          contactName: contactName,
                          phoneNumber: phoneNumber,
                          email: email,
                        ),
                      ));
                },
                //dense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                title: Text(
                  contactName,
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
            itemCount: contacts.length,
          ),
        );
      },
    );
  }
}
