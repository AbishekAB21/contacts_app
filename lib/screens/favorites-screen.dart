import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/utils/fontstyles.dart';
import 'package:contacts_app/widgets/fav-list-builder.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
                      "Favorites",
                      style: Fontstyles.HeadlineStyle1(context),
                    )),
                SizedBox(height: 20),
      
                // Contact
                FavoritesListBuilder()
              ],
            ),
          ),
        ),
    );
  }
}