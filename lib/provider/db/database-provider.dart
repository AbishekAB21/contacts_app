import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:contacts_app/widgets/reusable-snackbar.dart';
import 'package:flutter/material.dart';

class DatabaseProvider with ChangeNotifier {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  // Add Contacts
  Future<void> addContacts(
      Map<String, dynamic> contactMap, BuildContext context) async {
    try {
      await _firebase.collection('contacts').add(contactMap);
      ReusableSnackbar().showSnackbar(
          context, "Successfully added contact", appcolor.successColor);
    } catch (e) {
      ReusableSnackbar().showSnackbar(
          context, "Error adding contact", appcolor.errorColor);
      print(e);
    }
  }

  // Get Contact

  // Edit Contact (identify using phone number)

  // Delete Contact (identify using phone number)

  // Add to Favorites

  // Get Favorites

  // Remove from Favorites (identify using phone number)
}
