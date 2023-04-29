import 'package:contact_app/core/providers/app_providers.dart';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/screens/auth/login/login_screen.dart';
import 'package:contact_app/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  final _splashProvider = FutureProvider.autoDispose<void>((ref) async {
    final authRepository = ref.watch(authRepositoryProvider);
    final uid = authRepository.getUid();
    try {
      await Future.delayed(const Duration(milliseconds: 1500), () async {
        if(uid != null){
          final userRepository = ref.watch(userRepositoryProvider);
          final user = await userRepository.getUserById(uid);
          ref.read(userProvider).setUser(user);
        } else {
          throw 'User no logged';
        }
      });
    } catch (e) {
      throw 'User no logged';
    }
  });

  @override
  Widget build(BuildContext context) {
    ref.watch(_splashProvider);
    ref.listen<AsyncValue>(_splashProvider, (_, value) {
      value.maybeWhen(data: (data) {
        Navigator.pushReplacementNamed(context, HomeScreen.route);
      }, orElse: () {
        Navigator.pushReplacementNamed(context, LoginScreen.route);
      });
    });
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(92),
        child: Center(
          child: Lottie.asset(
            'assets/lottie/logo.json',
            width: 200
          ),
        ),
      ),
    );
  }
}