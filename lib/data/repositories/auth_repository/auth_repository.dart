import 'package:contact_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:contact_app/data/repositories/auth_repository/iauth_repository.dart';

class AuthRepository extends IAuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw ArgumentError(e.code);
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      //print('code: ${e.code}, message: ${e.message}');
      throw ArgumentError(e.code);
    }
  }

  @override
  Future<bool> isLogged() async {
    User? user = _auth.currentUser;
    return user != null;
  }

  @override
  Future<void> reload() async {
    User? user = _auth.currentUser;
    await user?.reload();
  }

  @override
  User getUser() {
    return _auth.currentUser!;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<bool> checkExistUser(String email) async {
    final response = await _auth.fetchSignInMethodsForEmail(email);
    return response.isNotEmpty;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ArgumentError(e.message);
    }
  }

  @override
  String? getUid() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  @override
  Future<void> updatePassword(UserModel user, String newPassword) async {
    final userAuth = _auth.currentUser;
    if (userAuth != null) {
      try {
        await userAuth.updatePassword(newPassword);
      } on FirebaseAuthException catch (e) {
        throw e.message!;
      }
    } else {
      throw 'Sign out and sign in again.';
    }
  }
}