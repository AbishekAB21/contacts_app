import 'package:contacts_app/provider/db/database-provider.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesListBuilder extends StatelessWidget {
  const FavoritesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final _dbProvider = Provider.of<DatabaseProvider>(context);
    return StreamBuilder(
      stream: _dbProvider.getFavoriteContactsStream(),
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

        final favContacts = snapshot.data!;

      return  Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final favContact = favContacts[index];
              final favName = favContact['name'];
              final favPhone = favContact['phone'];
              // final favEmail = favContact['email'];
              return ListTile(
                onTap: () {},
                dense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                title: Text(
                 favName,
                  style: Fontstyles.HeadlineStyle3(context),
                ),
                subtitle: Text(
                  favPhone,
                  style: Fontstyles.ContentTextStyle(context),
                ),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/person.png"),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        highlightColor: appcolor.teritiaryColor,
                        onPressed: () {},
                        icon: Icon(
                          Icons.call,
                          color: appcolor.buttonColor,
                        )),
                    IconButton(
                        highlightColor: appcolor.teritiaryColor,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: appcolor.teritiaryColor,
                        )),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(color: appcolor.teritiaryColor);
            },
            itemCount: favContacts.length,
          ),
        );
      },
    );
  }
}
