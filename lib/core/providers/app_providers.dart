import 'package:contact_app/core/providers/user_provider.dart';
import 'package:contact_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:contact_app/data/repositories/auth_repository/iauth_repository.dart';
import 'package:contact_app/data/repositories/contact_repository/contact_repository.dart';
import 'package:contact_app/data/repositories/contact_repository/icontact_repository.dart';
import 'package:contact_app/data/repositories/storage_repository/istorage_repository.dart';
import 'package:contact_app/data/repositories/storage_repository/storage_repository.dart';
import 'package:contact_app/data/repositories/user_repository/iuser_repository.dart';
import 'package:contact_app/data/repositories/user_repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider();
});

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository();
});

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRepository();
});

final storageRepositoryProvider = Provider<IStorageRepository>((ref) {
  return StorageRepository();
});

final contactRepositoryProvider = Provider<IContactRepository>((ref) {
  return ContactRepository();
});
