String? validateNonEmptyInput(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese un valor';
  }
  return null;
}

String? contactNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'El nombre es obligatorio';
  } else if (value.length < 2) {
    return 'El nombre debe tener al menos 2 caracteres';
  } else if (value.length > 50) {
    return 'El nombre debe tener como máximo 50 caracteres';
  }
  return null;
}

String? validateDniNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  if (value.length < 6 || value.length > 10) {
    return 'Este campo debe tener entre 6 y 10 dígitos';
  }
  return null;
}

String? validateEmail(String? value) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese su correo electrónico';
  } else if (!emailRegex.hasMatch(value)) {
    return 'Por favor, ingrese una dirección de correo electrónico válida';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese un valor';
  } else if (value.length < 2) {
    return 'El valor ingresado es demasiado corto';
  } else if (value.length > 50) {
    return 'El valor ingresado es demasiado largo';
  } else if (RegExp(r'[0-9]').hasMatch(value)) {
    return 'El valor ingresado no debe contener números';
  } else if (RegExp(r'[^\w\s]').hasMatch(value)) {
    return 'El valor ingresado no debe contener caracteres especiales';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese un valor';
  } else if (value.length < 10) {
    return 'La contraseña debe tener al menos 10 caracteres';
  } else if (value.length > 60) {
    return 'La contraseña debe tener como máximo 60 caracteres';
  } else if (!RegExp(r'[a-zA-Z]').hasMatch(value) ||
      !RegExp(r'[0-9]').hasMatch(value) ||
      !RegExp(r'[!@#\$&*~]').hasMatch(value)) {
    return 'La contraseña debe contener números, letras, al menos una letra mayúscula y una minúscula y al menos un carácter especial';
  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'La contraseña debe contener al menos una letra minúscula';
  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'La contraseña debe contener al menos una letra mayúscula';
  } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
    return 'La contraseña debe contener al menos un carácter especial';
  }
  return null;
}

String? validateConfirmPassword(String? value, String passwordValue) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese un valor';
  } else if (value != passwordValue) {
    return 'Las contraseñas no coinciden';
  }
  return null;
}
