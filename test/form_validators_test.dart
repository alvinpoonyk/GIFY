import 'package:gify/validators/form_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late String inputString;
  late String errorMessage;

  group('isStringEmpty', () {
    test('Should return a error message string', () {
      // arrange
      inputString = '';
      errorMessage = 'This field cannot be empty';
      // act
      final result = isStringEmpty(
          value: inputString, errorMessage: errorMessage);
      // assert
      expect(result, errorMessage);
    });

    test('Should return a null', () {
      // arrange
      inputString = 'a random string';
      // act
      final result = isStringEmpty(value: inputString, errorMessage: errorMessage);
      // assert
      expect(result, null);
    });
  });

  group('isValidEmail', ()
  {
    test('Should return a error message', () {
      // arrange
      final List<String> inputStrings = [
        'a',
        'alvin.',
        'alvin@',
        'alvin@gmail',
        'alvin.com',
        'alvin@.com'
      ];
      errorMessage = 'Please enter a valid email address';
      // act
      for (String input in inputStrings) {
        final result = isValidEmail(value: input, errorMessage: errorMessage);
        // assert
        expect(result, errorMessage);
      }
    });

    test('Should return a null', () {
      // arrange
      inputString = 'alvin@gmail.com';
      // act
      final result = isValidEmail(value: inputString, errorMessage: errorMessage);
      // assert
      expect(result, null);
    });

  });

  group('isValidPassword', () {
    // arrange
    test('Should return the respective error messages string or null', () {
      final Map<String, String?> inputAndErrorMessagePairs = {
        '' : noPasswordErrorMessage,
        'qweasdzxc' : notLongEnoughPasswordErrorMessage,
        'qqweasdzxc' : noUpperCaseAndLowerCaseErrorMessage,
        'QQWEASDZXC' : noUpperCaseAndLowerCaseErrorMessage,
        'Qqweasdzxc': noDigitErrorMessage,
        'Qqweasdzxc1' : noSpecialCharacterErrorMessage,
        'Qqweasdzxc1!' : null,
      };

      // act
      inputAndErrorMessagePairs.forEach((inputString, errorMessage) {
        final result = isValidPassword(value: inputString);
        // assert
        expect(result, errorMessage);
      });
    });

  });

  group('isValidConfirmPassword', () {
    test ('Should return no password entered error message string', () {
      // arrange
      final String password  = '';
      final String confirmPassword = '';
      // act
      final result = isValidConfirmPassword(password: password, confirmPassword: confirmPassword);
      // assert
      expect(result, noPasswordErrorMessage);
    });

    test('Should return passwords not match error message string', () {
      // arrange
      final String password = 'Qqweasdzxc1!';
      final String confirmPassword = 'Qqweasdzxc1!!';
      // act
      final result = isValidConfirmPassword(password: password, confirmPassword: confirmPassword);
      // assert
      expect(result, passwordsNotMatchErrorMessage);
    });

    test('Should return a null', () {
      // arrange
      final String password = 'Qqweasdzxc1!';
      final String confirmPassword = 'Qqweasdzxc1!';
      // act
      final result = isValidConfirmPassword(password: password, confirmPassword: confirmPassword);
      // assert
      expect(result, null);
    });

  });

}