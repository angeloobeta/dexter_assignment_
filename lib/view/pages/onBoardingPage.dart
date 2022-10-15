import 'package:dexter_assignment/model/imports/generalImport.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return baseUi(children: [
      rowPositioned(
          top: 30,
          child: GeneralTextDisplay(
              "dexter", red!, 1, 80, FontWeight.w900, "dexter")),
      rowPositioned(
          top: 120,
          left: 120,
          child: GeneralTextDisplay(
              "voice of healthcare", white, 1, 20, FontWeight.w900, "dexter")),
      // title
      rowPositioned(
          child: GeneralTextDisplay(
              "Welcome", grey!, 1, 30, FontWeight.w900, "welcome"),
          top: 340),
      // subTitle
      rowPositioned(
          child: GeneralTextDisplay(
            "Welcome to dexter health! Nurses are \nliterally saving our lives. We have \n"
                "designed a voice assistant and smart \n"
                "speaker to help nurses do what they \ndo best - care for patients",
            grey!,
            5,
            15,
            FontWeight.w700,
            "voice of healthcare",
            textAlign: TextAlign.center,
          ),
          left: 24,
          right: 24,
          top: 400),
      // Get started
      rowPositioned(
          child: buttonWidget(
              buttonColor: red,
              text: "Get Started",
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              }),
          top: 524),
      // sign in
      rowPositioned(
          child: buttonWidget(
              text: "Have an account? Sign In",
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
              buttonColor: black51,
              textColor: white),
          top: 600)
    ], allowBackButton: false);
  }
}
