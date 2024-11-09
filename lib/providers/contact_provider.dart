import 'package:flutter/material.dart';
import 'package:virtual_card/db/db_helper.dart';
import 'package:virtual_card/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  final db = DbHelper();

  // method to call insert method of DbHelper
  Future<int> insertContact(ContactModel contactModel) async {
    final rowId = await db.insertContact(contactModel);
    contactModel.id = rowId;
    contactList.add(contactModel);

    notifyListeners();
    return rowId;
  }

  Future<void> getAllContacts() async {
    contactList = await db.getAllContacts();
    notifyListeners();
  }

  Future<int> deleteContact(int id) async {
    return db.deleteContact(id);
  }

  Future<void> updateFavorite(ContactModel contactModel) async {
    print(contactModel.favorite);
    contactModel.favorite = !contactModel.favorite;
    final value = contactModel.favorite ? 0 : 1;
    print(value);
    await db.updateFavorite(contactModel.id, value);
    final index = contactList.indexOf(contactModel);
    contactList[index].favorite = !contactList[index].favorite;
    // print(contactList);

    notifyListeners();
  }

  Future<void> getAllFavoriteContacts() async {
    contactList = await db.getAllfavoriteContacts();
    notifyListeners();
  }
}
