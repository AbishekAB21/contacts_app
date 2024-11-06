import 'package:contacts_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class ReusableSnackbar {
  showSnackbar(
    BuildContext context,
    String message,
    Color color,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(
          message,
          style: Fontstyles.ButtonText1(context),
        )));
  }
}
