/// Returns null if String is not empty and errorMessage String if empty
isStringEmpty({required String? value, required String errorMessage}) {
  if (value == null || value.trim().isEmpty)
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

const String noPasswordErrorMessage = 'Please enter a password';
const String notLongEnoughPasswordErrorMessage = 'Password must be min 10 characters long';
const String noUpperCaseAndLowerCaseErrorMessage = 'Password must contain at least 1 uppercase and lowercase';
const String noDigitErrorMessage = 'Password must contain at least 1 digit';
const String noSpecialCharacterErrorMessage = 'Password must contain at least 1 special character';

/// Returns null if password is valid and a errorMessage String if invalid
isValidPassword({required String? value}) {
  if (value!.isEmpty) {
    return noPasswordErrorMessage;
  }
  if (value.length < 10) {
    return notLongEnoughPasswordErrorMessage;
  }
  if (!RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+").hasMatch(value)) {
    return noUpperCaseAndLowerCaseErrorMessage;
  }
  if (!RegExp(".*[0-9].*").hasMatch(value)) {
    return noDigitErrorMessage;
  }
  if (!RegExp("(?=.[\$@\$!% #+=()\^?&])").hasMatch(value)) {
    return noSpecialCharacterErrorMessage;
  }
  return null;
}

const String passwordsNotMatchErrorMessage = "Please ensure passwords match";

isValidConfirmPassword({required String? password, required String? confirmPassword}) {
  if (confirmPassword!.isEmpty) {
    return noPasswordErrorMessage;
  }
  if (confirmPassword.compareTo(password!) != 0) {
    return passwordsNotMatchErrorMessage;
  }
  return null;
}