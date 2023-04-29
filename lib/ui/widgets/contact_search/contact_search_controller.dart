import 'package:contact_app/data/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactSearchController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<ContactModel> contactsList = [];
  List<ContactModel> auxList = [];

  void setContactList(List<ContactModel> newContactList){
    contactsList = newContactList;
    auxList = contactsList;
    notifyListeners();
  }

  void searchInList(){
    searchController.addListener(() {
      if(searchController.text.isNotEmpty){
        contactsList = findContact(searchController.text);
        notifyListeners();
      } else {
        resetList();
      }
    });
  }

  List<ContactModel> findContact(String value) => auxList.where((contact) => contact.name.toLowerCase().contains(value.toLowerCase())).toList();

  void resetList(){
    contactsList = auxList;
    notifyListeners();
  }
}