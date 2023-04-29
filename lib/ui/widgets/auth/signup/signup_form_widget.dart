import 'package:contact_app/core/utils/validators.dart';
import 'package:contact_app/ui/widgets/auth/signup/signup_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpFormWidget extends ConsumerStatefulWidget {
  final SignUpFormController controller;
  const SignUpFormWidget({super.key, required this.controller});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends ConsumerState<SignUpFormWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller.nameController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Nombre',
          ),
          validator: validateName,
        ),
        const SizedBox(height: 24,),
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
          obscureText: !widget.controller.passwordVisible,
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
          validator: validatePassword,
        ),
        const SizedBox(height: 24,),
        TextFormField(
          controller: widget.controller.confirmPasswordController,
          obscureText: !widget.controller.confirmPasswordVisible,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: 'Confirmar contraseña',
            suffixIcon: IconButton(
              icon: Icon(
                widget.controller.confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                widget.controller.changeConfirmPasswordVisible();
              },
            ),
          ),
          validator: (value) => validateConfirmPassword(value, widget.controller.passwordController.text),
        )
      ],
    );
  }
}