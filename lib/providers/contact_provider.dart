import 'package:flutter/material.dart';
import 'package:virtual_card/db/db_helper.dart';
import 'package:virtual_card/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  final db = DbHelper();

  // method to call insert method of DbHelper
  Future<int> insertContact(ContactModel contactModel) {
    return db.insertContact(contactModel);
  }

  Future<void> getAllContacts() async {
    contactList = await db.getAllContacts();
    notifyListeners();
  }
}
