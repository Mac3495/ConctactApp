import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/dialogs/dialog_handler.dart';
import 'package:contact_app/core/utils/show_loading.dart';
import 'package:contact_app/ui/screens/auth/login/login_model.dart';
import 'package:contact_app/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:contact_app/ui/screens/home/home_screen.dart';
import 'package:contact_app/ui/widgets/auth/login/login_form_widget.dart';
import 'package:contact_app/ui/widgets/auth/login/login_form_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const String route = '/Login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final loginFormController = LoginFormController();

  void loginUser() async {
    if(_formKey.currentState!.validate()){
      try {
        showLoading(context);
        final model = ref.read(loginProvider.notifier);
        final status = await model.login(
          loginFormController.emailController.text, 
          loginFormController.passwordController.text
        );
        if(status){
          goToHomePage();
        } else {
          Navigator.of(context).pop();
          DialogHandler.showCustomDialog(context, title: 'Error al iniciar sesion', type: TypeDialog.error);
        } 
      } catch (e){
        Navigator.of(context).pop();
        DialogHandler.showCustomDialog(context, title: '$e', type: TypeDialog.error);
      }
    }
  }

  void goToHomePage(){
    Navigator.of(context).pop();
    Navigator.pushReplacementNamed(context, HomeScreen.route);
  }

  void goToSignUpScreen(){
    Navigator.pushNamed(context, SignUpScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 78, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/contact.png',
                    width: 120,
                  ),
                  const SizedBox(height: 64,),
                  AnimatedBuilder(
                    animation: loginFormController,
                    builder: (context, snapshot) {
                      return LoginFormWidget(controller: loginFormController);
                    }
                  ),
                  const SizedBox(height: 24,),
                  ElevatedButton(
                    onPressed: loginUser, 
                    child: const Text('Iniciar Sesión')
                  ),
                  const SizedBox(height: 22,),
                  RichText(
                    text: TextSpan(
                      text: 'No tienes una cuenta?',
                      style: const TextStyle(
                        color: Colors.black, 
                        fontSize: 14
                      ),
                      children: <TextSpan>[
                        TextSpan(text: ' Registrate',
                          style: const TextStyle(
                            color: AppColors.primary, 
                            fontSize: 14
                          ),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            goToSignUpScreen();
                          }
                        )
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}