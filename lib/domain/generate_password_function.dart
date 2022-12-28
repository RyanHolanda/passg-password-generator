// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

String? generatedPassword;

class GeneratePassword {
  bool? isUpperCaseAllowed;
  bool? isSymbolsAllowed;
  bool? isLowerCaseAllowed;
  bool? isNumberAllowed;
  GeneratePassword({
    required this.isUpperCaseAllowed,
    required this.isSymbolsAllowed,
    required this.isLowerCaseAllowed,
    required this.isNumberAllowed,
  });
  String generatePassword() {
    const lenght = 20;
    const lettersLowerCase = 'abcdefghijklmnopqrstuvwxyx';
    const lettersUpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const specialCharacters = r'!@#$%*(){}~^:;/|-_[]?';

    String chars = '';
    isLowerCaseAllowed! && isUpperCaseAllowed!
        ? chars += '$lettersUpperCase$lettersLowerCase'
        : null;
    isLowerCaseAllowed! && isUpperCaseAllowed == false
        ? chars += lettersLowerCase
        : null;
    isLowerCaseAllowed == false && isUpperCaseAllowed!
        ? chars += lettersUpperCase
        : null;
    isNumberAllowed! ? chars += numbers : null;
    isSymbolsAllowed! ? chars += specialCharacters : null;
    return generatedPassword = List.generate(lenght, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }
}
