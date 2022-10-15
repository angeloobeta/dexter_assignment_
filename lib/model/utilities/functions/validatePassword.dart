// the password must be more than 8,it must lower case, upper case, digits, and special charactes
bool isValidPassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp =  RegExp(pattern);
  return regExp.hasMatch(value);
}