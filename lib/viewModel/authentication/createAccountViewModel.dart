import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/viewModel/baseModel.dart';

class CreateAccountViewModel extends BaseModel {
//? text fields
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bvnController = TextEditingController();
  TextEditingController referralController = TextEditingController();

  //? error booleans
  bool phoneError = false;
  bool passwordError = false;
  bool emailError = false;
  bool firstNameError = false;
  bool lastNameError = false;
  bool bvnError = false;
  bool referralError = false;

  // ? focus Nodes
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode bvnFocusNode = FocusNode();
  FocusNode referralFocusNode = FocusNode();

  // ? function and parameters for obscure text
  bool showText = true;

  showTextFunction() {
    showText = !showText;
    notifyListeners();
  }

  // valid email as user types in, using the unchanged value from the
  // generalTextField
  onChangedFunctionEmail() {
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus == false) {
        emailError = false;
        notifyListeners();
      }
    });
    if (validateEmail.isValidEmail(emailController.text.trim())) {
      emailError = false;
      notifyListeners();
    } else {
      emailError = true;
      notifyListeners();
    }
  }

  // onChanged function for first name
  onChangedFunctionFirstName() {
    firstNameFocusNode.addListener(() {
      if (firstNameFocusNode.hasFocus == false) {
        firstNameError = false;
        notifyListeners();
      }
    });
    if (firstNameController.text.length <= 2) {
      print('there is error');
      firstNameError = true;
      notifyListeners();
    } else {
      print('there is no error');
      firstNameError = false;
      notifyListeners();
    }
  }

  // onChanged function for last name
  onChangedFunctionLastName() {
    lastNameFocusNode.addListener(() {
      if (lastNameFocusNode.hasFocus == false) {
        lastNameError = false;
        notifyListeners();
      }
    });
    if (lastNameController.text.length <= 2) {
      print('there is error');
      lastNameError = true;
      notifyListeners();
    } else {
      print('there is no error');
      lastNameError = false;
      notifyListeners();
    }
  }

  // onChanged function for phone entry
  onChangedFunction() {
    phoneFocusNode.addListener(() {
      if (phoneFocusNode.hasFocus == false) {
        phoneError = false;
        notifyListeners();
      }
    });
    if (validatePhone.isValidPhone(phoneController.text.trim())) {
      phoneError = false;
      notifyListeners();
    } else {
      phoneError = true;
      notifyListeners();
    }
  }

  // onChanged function for password entry
  onChangedFunctionPassword() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus == false) {
        passwordError = false;
        notifyListeners();
      }
    });
    if (isValidPassword(passwordController.text.trim())) {
      passwordError = false;
      notifyListeners();
    } else {
      passwordError = true;
      notifyListeners();
    }
  }

  // create user account
  // createUserAccount(context) async {
  //   if (firstNameController.text.length <= 2) {
  //     print('there is error');
  //     firstNameError = true;
  //     firstNameFocusNode.requestFocus();
  //     notifyListeners();
  //   } else if (lastNameController.text.length <= 2) {
  //     print('there is error');
  //     lastNameError = true;
  //     lastNameFocusNode.requestFocus();
  //     notifyListeners();
  //   } else if (!validatePhone.isValidPhone(phoneController.text.trim())) {
  //     phoneError = true;
  //     phoneFocusNode.requestFocus();
  //     notifyListeners();
  //   } else if (!validateEmail.isValidEmail(emailController.text.trim())) {
  //     emailError = true;
  //     emailFocusNode.requestFocus();
  //     notifyListeners();
  //   } else if (!isValidPassword(passwordController.text.trim())) {
  //     passwordError = true;
  //     passwordFocusNode.requestFocus();
  //     notifyListeners();
  //   } else {
  //     cancellationToken = CancellationToken();
  //     notifyListeners();
  //     // load baseUrl
  //     loadBaseurl().then((value) async {
  //       loadingDialog(context,
  //           text: "Kindly hold on, we are Setting up your account",
  //           onWillPop: () {
  //         return cancel(context);
  //       });
  //       await newUser
  //           .createAccountFunction(
  //               cancellationToken: cancellationToken!,
  //               baseUrl: baseUrl,
  //               firstName: firstNameController.text.trim(),
  //               lastName: lastNameController.text.trim(),
  //               phone: phoneController.text.trim(),
  //               password: passwordController.text.trim(),
  //               email: emailController.text.trim(),
  //               referralCode: referralController.text.trim())
  //           .then((value) async {
  //         if (value is CreateAccountResponse) {
  //           SchedulerBinding.instance?.addPostFrameCallback(
  //             (_) => showDialog(
  //               barrierDismissible: false,
  //               context: context,
  //               builder: (context) => Center(
  //                 child: S(
  //                   h: 200,
  //                   w: 200,
  //                   child: customDialog(
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           GeneralIconDisplay(FontAwesomeIcons.circleCheck,
  //                               green, UniqueKey(), 50),
  //                           S(h: 20),
  //                           GeneralTextDisplay(
  //                             "${firstNameController.text} Welcome to MoniTree, Your account has been created successfully",
  //                             white,
  //                             3,
  //                             14,
  //                             FontWeight.w500,
  //                             "",
  //                             textAlign: TextAlign.center,
  //                           )
  //                         ],
  //                       ),
  //                       align: Alignment.center),
  //                 ),
  //               ),
  //             ),
  //           );
  //           // save token to storage
  //           await localStorage.setString(token, value.token!).then((_) async {
  //             //print(value);
  //             await Future.delayed(const Duration(seconds: 3), () async {
  //               Navigator.pop(context);
  //               // save page state
  //               await localStorage.setString(appStatus, verificationPage);
  //               Navigator.pushReplacementNamed(context, '/verifyCode',
  //                   arguments: value.token);
  //               // Navigator.pushReplacementNamed(context, '/signIn',
  //               //     arguments: value.token);
  //             });
  //           });
  //         } else if (value is CreateAccountError) {
  //           Navigator.pop(context);
  //           loaderWithClose(context,
  //               text: value.message!
  //                       .contains("Unknown data integrity issue with resource")
  //                   ? "Phone number or email address already exist in the database"
  //                   : value.message!);
  //           // SchedulerBinding.instance?.addPostFrameCallback(
  //           //   (_) => showDialog(
  //           //     barrierDismissible: false,
  //           //     context: context,
  //           //     builder: (context) => Center(
  //           //       child: S(
  //           //         h: 220,
  //           //         w: 220,
  //           //         child: customDialog(
  //           //             Column(
  //           //               mainAxisAlignment: MainAxisAlignment.center,
  //           //               children: [
  //           //                 GeneralIconDisplay(
  //           //                     Icons.error, error, UniqueKey(), 50),
  //           //                 S(h: 20),
  //           //                 GeneralTextDisplay(
  //           //                   value.message!.contains(
  //           //                           "Unknown data integrity issue with resource")
  //           //                       ? "Phone number or email address already exist in the database"
  //           //                       : value.message!,
  //           //                   white,
  //           //                   3,
  //           //                   14,
  //           //                   FontWeight.w500,
  //           //                   "",
  //           //                   textAlign: TextAlign.center,
  //           //                 ),
  //           //                 S(h: 15),
  //           //                 Row(
  //           //                   mainAxisAlignment: MainAxisAlignment.center,
  //           //                   children: [
  //           //                     GestureDetector(
  //           //                       onTap: () {
  //           //                         Navigator.pop(context);
  //           //                       },
  //           //                       child: const GeneralTextDisplay(
  //           //                         "close",
  //           //                         green,
  //           //                         3,
  //           //                         14,
  //           //                         FontWeight.w400,
  //           //                         "",
  //           //                       ),
  //           //                     ),
  //           //                   ],
  //           //                 )
  //           //               ],
  //           //             ),
  //           //             align: Alignment.center),
  //           //       ),
  //           //     ),
  //           //   ),
  //           // );
  //         }
  //       }).catchError((errorValue) {
  //         if (errorValue is SocketException) {
  //           Navigator.pop(context);
  //           loaderWithClose(
  //             context,
  //             text:
  //                 "Unable to complete request, kindly check your internet connection and try again",
  //           );
  //         } else if (errorValue
  //                 .toString()
  //                 .contains('Invalid argument(s): No host specified in URI') ||
  //             errorValue.toString().contains('No host specified in URI') ||
  //             errorValue
  //                 .toString()
  //                 .contains("Null check operator used on a null value") ||
  //             errorValue
  //                 .toString()
  //                 .contains(" The error handler of Future.catchError")) {
  //           Navigator.pop(context);
  //           loaderWithClose(context, text: 'Invalid base url');
  //         }
  //       });
  //     });
  //     // create account
  //     try {} on SocketException catch (_) {
  //       Navigator.pop(context);
  //       loaderWithClose(
  //         context,
  //         text:
  //             "Unable to complete request, kindly check your internet connection and try again",
  //       );
  //     }
  //   }
  //
  //   // go to new page, with success,
  //
  //   // return error dialog on error
  // }

}
