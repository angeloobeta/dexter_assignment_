// constants of string
// screen sizing
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../view/uiElements/screenSizing.dart';
import '../functions/sharedPreference.dart';
import '../functions/validateEmail.dart';
import '../functions/validatePhoneNumber.dart';

String token = "userToken";
String loginStatus = "loginStatus";
String savingIdString = 'savingsId';
String accountIDString = 'accountIDString';
String baseUrlString = 'baseUrlString';
String appStatus = 'appStatus';
String resetCode = 'resetCode';
String verificationPage = "verificationPage";
String logoutStatus = "logoutStatus";
String verifyEmailAddress = "emailAddress";

//? fetch user details
String firstName = 'firstName';
String lastName = 'lastName';
String phoneNumber = 'phoneNumber';
String customerAccountNumber = 'accountNumber';

//? Personal Detail for submission
String customerMiddleName = 'middleName';
String customerDOB = 'customerDob';
String customerEmail = 'customerEmail';
String customerGender = 'customerGender';
String customerHomeAddress = 'customerAddress';
String customerBVN = 'customerBVN';
String customerFaceID = 'customerFaceID';
String customerDoc1 = 'customerDoc1';
String customerDoc2 = 'customerDoc2';
String userPersonalDetailList = 'userPersonalDetailList';

// Personal Detail Page
String? middleName;
String? emailAddress;
String? genderBase;
String? homeAddress;
String? bvnNumber;
String? dob;

ScreenSize sS(
  BuildContext context,
) =>
    ScreenSize(context: context);

// class instances
LocalStorage localStorage = LocalStorage();
ValidateEmailAddress validateEmail = ValidateEmailAddress();
ValidatePhoneNumber validatePhone = ValidatePhoneNumber();

// package initialization
// or new Dio with a BaseOptions instance.
var options = BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = Dio(options);
