import 'package:flutter/material.dart';

import '../../model/utilities/constants/strings.dart';
import '../../model/utilities/functions/validatePassword.dart';
import '../baseModel.dart';

class SignInViewModel extends BaseModel {
//? text fields
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController baseUrlController = TextEditingController();

  //? error booleans
  bool phoneError = false; //? error booleans
  bool baseUrlError = false;
  bool passwordError = false;

// ? focus Nodes
  FocusNode phoneFocusNode = FocusNode(); // ? focus Nodes
  FocusNode baseUrlFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

// ? function and parameters for obscure text
  bool showText = true;

  showTextFunction() {
    showText = !showText;
    notifyListeners();
  }

  // onChanged function for phone number and password
  onChangedFunction() {
    phoneFocusNode.addListener(() {
      if (phoneFocusNode.hasFocus == false) {
        phoneError = false;
        notifyListeners();
      }
    });

    if (int.tryParse(loginPhoneController.text) == null) {
      if (validateEmail.isValidEmail(loginPhoneController.text.trim())) {
        phoneError = false;
        notifyListeners();
      } else {
        phoneError = true;
        notifyListeners();
      }
    } else if (int.tryParse(loginPhoneController.text) != null) {
      if (validatePhone.isValidPhone(loginPhoneController.text.trim())) {
        phoneError = false;
        notifyListeners();
      } else {
        phoneError = true;
        notifyListeners();
      }
    } else {
      phoneError = true;
      notifyListeners();
    }
  } // onChanged function for password entry

  onChangedFunctionPassword() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus == false) {
        passwordError = false;
        notifyListeners();
      }
    });
    if (isValidPassword(loginPasswordController.text.trim())) {
      passwordError = false;
      notifyListeners();
    } else {
      passwordError = true;
      notifyListeners();
    }
  }

  // login user

}
