
import 'package:contacts_app/utils/app-color.dart';
import 'package:flutter/material.dart';

class Fontstyles{

  static TextStyle logoTextstyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 30,
      
      fontWeight: FontWeight.w700,
      letterSpacing: 1
    );
  }
  static TextStyle logoTextstyle2(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
     
      fontWeight: FontWeight.w700,
      letterSpacing: 1
    );
  }

  static TextStyle lightTextStyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: appcolor.teritiaryColor,
      fontWeight: FontWeight.w300
    );
  }

  static TextStyle lightTextStyle2(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: appcolor.teritiaryColor,
      fontWeight: FontWeight.w300
    );
  }

  static TextStyle ContentTextStyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: appcolor.primaryColor,
      fontWeight: FontWeight.w700
    );
  }

   static TextStyle ContentTextStyle2(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w700
    );
  }

   static TextStyle ContentTextStyle3(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      color: Colors.black,
      // color: Colors.grey.shade400,
      fontWeight: FontWeight.w400
    );
  }

   static TextStyle ContentTextStyle4(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle HeadlineStyle0(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 30,
      color: appcolor.primaryColor,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle HeadlineStyle1(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: appcolor.primaryColor,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle HeadlineStyle2(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      color: appcolor.primaryColor,
      fontWeight: FontWeight.w700
    );
  }

  static TextStyle HeadlineStyle3(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: appcolor.primaryColor,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle BoldandSmallStyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w900
    );
  }

  static TextStyle SmallStyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle ButtonText3(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle ButtonText2(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle ButtonText1(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle ButtonTextLarge(BuildContext context){

    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w600
    );
  }
}