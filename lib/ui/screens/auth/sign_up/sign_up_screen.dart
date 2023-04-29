import 'package:contact_app/core/utils/dialogs/dialog_handler.dart';
import 'package:contact_app/core/utils/show_loading.dart';
import 'package:contact_app/data/models/user_model.dart';
import 'package:contact_app/ui/screens/auth/sign_up/sign_up_model.dart';
import 'package:contact_app/ui/screens/home/home_screen.dart';
import 'package:contact_app/ui/widgets/auth/signup/signup_form_controller.dart';
import 'package:contact_app/ui/widgets/auth/signup/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static const String route = '/Signup';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  final signUpFormController = SignUpFormController();

  void createUser() async {
    if(_formKey.currentState!.validate()){
      try {
        showLoading(context);
        final model = ref.read(signUpProvider.notifier);
        final user = UserModel(
          name: signUpFormController.nameController.text, 
          email: signUpFormController.emailController.text
        );
        await model.createUser(user, signUpFormController.confirmPasswordController.text);
        goToHomePage();
      } catch (e) {
        DialogHandler.showCustomDialog(context, title: '$e', type: TypeDialog.error);
      }
    }
  }

  void goToHomePage(){
    Navigator.of(context).pop();
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.route,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrate'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: signUpFormController,
                  builder: (context, snapshot) {
                    return SignUpFormWidget(controller: signUpFormController);
                  }
                ),
                const SizedBox(height: 24,),
                ElevatedButton(
                  onPressed: createUser, 
                  child: const Text('Registrar')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}