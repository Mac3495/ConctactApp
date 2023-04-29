import 'package:contact_app/core/providers/app_providers.dart';
import 'package:contact_app/core/states/charging_state.dart';
import 'package:contact_app/data/repositories/auth_repository/iauth_repository.dart';
import 'package:contact_app/data/repositories/user_repository/iuser_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginModel, ChargingState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return LoginModel(
    authRepository: authRepository,
    userRepository: userRepository,
    reader: ref.read
  );
});

class LoginModel extends StateNotifier<ChargingState>{
  
  final IAuthRepository authRepository;
  final IUserRepository userRepository;
  final Reader reader;

  LoginModel({
    required this.authRepository,
    required this.userRepository,
    required this.reader,
  }) : super(const ChargingState.loading());


  Future<bool> login(String email, String password) async {
    state = const  ChargingState.loading();
    try {
      final authUserId = await authRepository.signInWithEmailAndPassword(email, password);
      final user = await userRepository.getUserById(authUserId);
      user.id = authUserId;
      reader(userProvider.notifier).setUser(user);
      state = const  ChargingState.data('Success');
      return true;
    } catch (e) {
      print(e);
      state =  ChargingState.error(e.toString());
    }
    return false;
  }
}