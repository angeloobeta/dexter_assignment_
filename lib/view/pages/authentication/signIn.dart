import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/viewModel/authentication/signInViewModel.dart';
import 'package:stacked/stacked.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        onModelReady: (model) async {},
        disposeViewModel: false,
        builder: (context, model, child) => baseUi(children: [
              // get started
              AdaptivePositioned(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GeneralTextDisplay("Sign into \ndexter", red!, 2, 28,
                          FontWeight.w700, ""),
                    ],
                  ),
                  left: 24,
                  top: 92),
              // text field and sign in button
              Positioned(
                  child: SingleChildScrollView(
                    child: S(
                      w: 375,
                      h: 700,
                      child: Column(
                        children: [
                          S(h: 5),
                          // phone number
                          textAndTextField(context,
                              borderColor: white,
                              textInputType: TextInputType.text,
                              controller: model.loginPhoneController,
                              hint: "Enter phone number / email address",
                              onChanged: () {},
                              inputFormatter: [],
                              errorTextActive: model.phoneError,
                              focusNode: model.phoneFocusNode,
                              prefix: null,
                              suffix: null,
                              labelText: 'Phone Number/ Email address'),
                          S(h: 20),
                          // password
                          textAndTextField(context,
                              textInputType: TextInputType.text,
                              controller: model.loginPasswordController,
                              hint: "Enter a secure password",
                              onChanged: () {},
                              inputFormatter: [],
                              errorTextActive: model.passwordError,
                              focusNode: model.passwordFocusNode,
                              obscureText: false,
                              prefix: null,
                              suffix: GestureDetector(
                                  onTap: () {},
                                  child: GeneralIconDisplay(
                                      model.showText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      const Color.fromRGBO(51, 51, 57, 1),
                                      UniqueKey(),
                                      18)),
                              labelText: 'Password'),
                          S(h: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: GeneralTextDisplay("Forgot Password?",
                                    white, 1, 14, FontWeight.w600, ""),
                                onTap: () {},
                              ),
                              S(w: 24)
                            ],
                          ),
                          S(h: 24),
                          // sign up

                          buttonWidget(
                              text: "Login",
                              buttonColor: red,
                              child: rowPositioned(
                                  top: 15,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      Navigator.pushReplacementNamed(
                                          context, '/homePage');
                                    },
                                    child: GeneralIconDisplay(Icons.fingerprint,
                                        normalBlack, UniqueKey(), 25),
                                  )),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushReplacementNamed(
                                    context, '/homePage');
                              }),
                          S(h: 40),
                          // do you have an account

                          const GeneralTextDisplay("Do not have an account?",
                              white, 1, 15, FontWeight.w400, ""),

                          // sign in
                          S(h: 16),

                          buttonWidget(
                              text: "Sign Up as a new User",
                              onPressed: () {
                                Navigator.pushNamed(context, '/createAccount');
                              },
                              buttonColor: black51,
                              textColor: white),
                          S(h: 16),
                        ],
                      ),
                    ),
                  ),
                  top: sS(context).cH(height: 236),
                  bottom: 15,
                  left: 0,
                  right: 0),

              // fill the form below

              AdaptivePositioned(
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GeneralTextDisplay('Welcome back, we have been missing you',
                        white, 1, 14, FontWeight.w600, ""),
                  ],
                ),
                left: 24,
                top: 172,
              ),
            ], allowBackButton: true));
  }
}
