import 'package:contacts_app/utils/app-color.dart';
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
          height: 60,
          color: appcolor.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  highlightColor: appcolor.teritiaryColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_rounded,
                    color: appcolor.primaryColor,
                  )),
                  IconButton(
                  highlightColor: appcolor.teritiaryColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: appcolor.primaryColor,
                  )),
              IconButton(
                  highlightColor: appcolor.teritiaryColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_rounded,
                    color: appcolor.primaryColor,
                  )),
            ],
          ),
        );
  }
}