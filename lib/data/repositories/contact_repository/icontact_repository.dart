import 'package:contact_app/data/models/contact_model.dart';

abstract class IContactRepository {
  Future<void> createContact(ContactModel contact);
  Future<List<ContactModel>> getContactsById(String userId);
}