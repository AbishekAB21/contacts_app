import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app/screens/bottom-nav-bar.dart';
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
      ReusableSnackbar()
          .showSnackbar(context, "Error adding contact", appcolor.errorColor);
      print(e);
    }
  }

  // Get Contacts
  Stream<List<Map<String, dynamic>>> getContactsStream() {
    return _firebase.collection('contacts').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  // Edit Contact (identify using phone number)
  Future<void> editContacts(Map<String, dynamic> updatedContactMap,
      String oldPhoneNumber, BuildContext context) async {
    try {
      // find doc
      final querySnapshot = await _firebase
          .collection('contacts')
          .where('phone', isEqualTo: oldPhoneNumber)
          .limit(1)
          .get();
      // Updating contact
      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        await _firebase
            .collection('contacts')
            .doc(docId)
            .update(updatedContactMap);
        ReusableSnackbar().showSnackbar(context,
            "Updated contact details successfully!", appcolor.successColor);
        notifyListeners();
      }
    } catch (e) {
      print(e);
      ReusableSnackbar()
          .showSnackbar(context, "Error updating contact", appcolor.errorColor);
    }
  }

  // Delete Contact (identify using phone number)

  Future<void> deleteContacts(String phoneNumber, BuildContext context) async {
    try {
      // find doc
      final querySnapshot = await _firebase
          .collection('contacts')
          .where('phone', isEqualTo: phoneNumber)
          .limit(1)
          .get();
      // delete contact
      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        await _firebase.collection('contacts').doc(docId).delete();
        ReusableSnackbar()
            .showSnackbar(context, "Deleted contact", appcolor.successColor);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavBar(),
            ));
        notifyListeners();
      }
    } catch (e) {
      print(e);
      ReusableSnackbar()
          .showSnackbar(context, "Error updating contact", appcolor.errorColor);
    }
  }

  // Add to Favorites

  // Get Favorites

  // Remove from Favorites (identify using phone number)
}
