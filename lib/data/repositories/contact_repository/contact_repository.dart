import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/data/models/contact_model.dart';
import 'package:contact_app/data/repositories/contact_repository/icontact_repository.dart';

const contactCollection = 'Contact';

class ContactRepository extends IContactRepository {

  final _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createContact(ContactModel contact) async {
    await _firestore.collection(contactCollection)
      .doc()
      .set(contact.toMap(), SetOptions(merge: true));
  }

  @override
  Future<List<ContactModel>> getContactsById(String userId) async {
    final response = await _firestore
        .collection(contactCollection)
        .where('userId', isEqualTo: userId)
        .orderBy('createDate', descending: true)
        .get();
    return response.docs
        .map<ContactModel>((doc) => ContactModel.fromMap(doc.id, doc.data()))
        .toList();
  }

}