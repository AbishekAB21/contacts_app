import 'package:contacts_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  String title;
  EmptyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    "assets/sad-dog.png",
                    height: 200,
                    width: 200,
                  ),
                )),
                SizedBox(height: 10,),
                Text(title, style: Fontstyles.lightTextStyle2(context),)
              ],
            ),
          );
  }
}