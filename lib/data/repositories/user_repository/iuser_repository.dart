import 'package:contact_app/data/models/user_model.dart';

abstract class IUserRepository {
  Future<void> createUser(String userId, UserModel user);
  Future<UserModel> getUserById(String userId);
  Future<void> updateUser(String userId, UserModel user);
}