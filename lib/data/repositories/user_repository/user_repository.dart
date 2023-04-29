import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/data/models/user_model.dart';
import 'package:contact_app/data/repositories/user_repository/iuser_repository.dart';

const userCollection = 'User';

class UserRepository extends IUserRepository {

  final _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser(String userId, UserModel user) async {
    await _firestore.collection(userCollection)
      .doc(userId)
      .set(user.toMap(), SetOptions(merge: true));
  }
  
  @override
  Future<UserModel> getUserById(String userId) async {
    final response = await _firestore.collection(userCollection).doc(userId).get();
    return UserModel.fromMap(response.id, response.data()!);
  }
  
  @override
  Future<void> updateUser(String userId, UserModel user) async {
    await _firestore.collection(userCollection)
        .doc(userId)
        .set(user.toMap(), SetOptions(merge: true));
  }
}
