import 'package:contact_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<bool> isLogged();
  Future<void> reload();
  String? getUid();
  Future<void> signOut();
  Future<bool> checkExistUser(String email);
  Future<void> sendPasswordResetEmail(String email);
  User getUser();
  Future<void> updatePassword(UserModel user, String newPassword);
}