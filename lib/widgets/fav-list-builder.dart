import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class FavoritesListBuilder extends StatelessWidget {
  const FavoritesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            title: Text(
              'Nivi',
              style: Fontstyles.HeadlineStyle3(context),
            ),
            subtitle: Text(
              "8111898697",
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
        itemCount: 5,
      ),
    );
  }
}
