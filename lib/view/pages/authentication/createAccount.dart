import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/viewModel/authentication/createAccountViewModel.dart';
import 'package:stacked/stacked.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
        viewModelBuilder: () => CreateAccountViewModel(),
        onModelReady: (model) async {},
        disposeViewModel: false,
        builder: (context, model, child) {
          return baseUi(children: [
            // get started
            AdaptivePositioned(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GeneralTextDisplay(
                        "Get started with", white, 2, 28, FontWeight.w700, ""),
                    GeneralTextDisplay(
                        "dexter", red!, 2, 40, FontWeight.w700, ""),
                  ],
                ),
                left: 24,
                top: 40),
            // fill the form below
            AdaptivePositioned(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GeneralTextDisplay('Fill the form below to create an account',
                      white, 1, 14, FontWeight.w600, ""),
                ],
              ),
              left: 24,
              top: 150,
            ),
            Positioned(
                child: SingleChildScrollView(
                  child: S(
                    w: 375,
                    h: 900,
                    child: Column(
                      children: [
                        S(h: 5),
                        // first name
                        textAndTextField(context,
                            textInputType: TextInputType.text,
                            controller: model.firstNameController,
                            hint: "Enter your first name",
                            onChanged: () {},
                            inputFormatter: [],
                            errorTextActive: model.firstNameError,
                            focusNode: model.firstNameFocusNode,
                            prefix: null,
                            suffix: null,
                            labelText: 'First Name'),
                        S(h: 20),

                        // last name
                        textAndTextField(context,
                            textInputType: TextInputType.text,
                            controller: model.lastNameController,
                            hint: "Enter your surname", onChanged: () {
                          model.onChangedFunctionLastName();
                        },
                            inputFormatter: [],
                            errorTextActive: model.lastNameError,
                            focusNode: model.lastNameFocusNode,
                            prefix: null,
                            suffix: null,
                            labelText: 'Last Name'),
                        S(h: 20),

                        // phone number
                        textAndTextField(context,
                            textInputType: TextInputType.number,
                            controller: model.phoneController,
                            hint: "Enter phone number",
                            onChanged: () {},
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(11),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            errorTextActive: model.phoneError,
                            focusNode: model.phoneFocusNode,
                            prefix: null,
                            suffix: null,
                            labelText: 'Phone Number'),
                        S(h: 20),
                        // Email Address
                        textAndTextField(context,
                            textInputType: TextInputType.text,
                            controller: model.emailController,
                            hint: "Enter your email Address",
                            onChanged: () {},
                            inputFormatter: [],
                            errorTextActive: model.emailError,
                            focusNode: model.emailFocusNode,
                            prefix: null,
                            suffix: null,
                            labelText: 'Email Address'),
                        S(h: 20),

                        // password
                        textAndTextField(context,
                            textInputType: TextInputType.text,
                            controller: model.passwordController,
                            hint: "Enter a secure password",
                            onChanged: () {},
                            inputFormatter: [],
                            errorTextActive: model.passwordError,
                            focusNode: model.passwordFocusNode,
                            obscureText: model.showText,
                            prefix: null,
                            suffix: GestureDetector(
                                onTap: () {
                                  model.showTextFunction();
                                },
                                child: GeneralIconDisplay(
                                    model.showText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    const Color.fromRGBO(51, 51, 57, 1),
                                    UniqueKey(),
                                    18)),
                            labelText: 'Password'),
                        S(h: 30),
                        // sign up

                        buttonWidget(
                            text: "Sign Up",
                            buttonColor: red,
                            onPressed: () {}),
                        S(h: 30),
                        // do you have an account

                        const GeneralTextDisplay("Do you have an account?",
                            white, 1, 14, FontWeight.w400, ""),
                        S(h: 15),

                        // sign in

                        buttonWidget(
                            text: "Sign In",
                            onPressed: () {
                              Navigator.pushNamed(context, '/signIn');
                            },
                            buttonColor: black51,
                            textColor: white)
                      ],
                    ),
                  ),
                ),
                top: sS(context).cH(height: 200),
                bottom: 5,
                left: 0,
                right: 0),
          ], allowBackButton: false);
        });
  }
}
