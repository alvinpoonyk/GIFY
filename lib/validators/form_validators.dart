/// Returns null if String is not empty and errorMessage String if empty
isStringEmpty({required String? value, required String errorMessage}) {
  if (value!.isEmpty)
    return errorMessage;
  return null;
}

/// Returns null if email is valid and errorMessage String if invalid
isValidEmail({required String? value, required String errorMessage}) {
  final bool isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
  if (value.isEmpty || !isValidEmail)
    return errorMessage;
  return null;
}

/// Returns null if password is valid and a errorMessage String if invalid
isValidPassword({required String? value}) {
  if (value!.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 10) {
    return 'Password must be min 10 characters long';
  }
  if (!RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+").hasMatch(value)) {
    return 'Password must contain at least 1 uppercase and lowercase';
  }
  if (!RegExp(".*[0-9].*").hasMatch(value)) {
    return 'Password must contain at least 1 digit';
  }
  if (!RegExp("(?=.[\$@\$!% #+=()\^?&])").hasMatch(value)) {
    return 'Password must contain at least 1 special character';
  }
  return null;
}

isValidConfirmPassword({required String? password, required String? confirmPassword}) {
  if (confirmPassword!.isEmpty) {
    return "Please enter a valid password";
  }
  if (confirmPassword.compareTo(password!) != 0) {
    return "Please ensure passwords match";
  }
  return null;
}