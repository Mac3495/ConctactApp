import 'package:contact_app/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_app/ui/widgets/auth/login/login_form_controller.dart';

class LoginFormWidget extends ConsumerStatefulWidget {
  final LoginFormController controller;
  const LoginFormWidget({super.key, required this.controller});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends ConsumerState<LoginFormWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo',
          ),
          validator: validateEmail,
        ),
        const SizedBox(height: 24,),
        TextFormField(
          controller: widget.controller.passwordController,
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: IconButton(
              icon: Icon(
                widget.controller.passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                widget.controller.changePasswordVisible();
              },
            ),
          ),
          validator: validateNonEmptyInput,
        )
      ],
    );
  }
}