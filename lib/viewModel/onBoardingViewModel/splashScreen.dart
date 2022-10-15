import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/model/imports/viewModelImport.dart';

class SplashScreenViewModel extends BaseModel {
  // future to load image and go to sign in page
  Widget image = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      GeneralTextDisplay("dexter", red!, 1, 50, FontWeight.w900, "dexter"),
      const GeneralTextDisplay(
          "voice of health", black, 1, 20, FontWeight.w900, "dexter"),
      S(w: 100)
    ],
  );

  future(context) async {
    await Future.delayed(const Duration(milliseconds: 700), () {
      GeneralTextDisplay("dexter", red!, 1, 50, FontWeight.w900, "dexter");
      const GeneralTextDisplay(
          "dexter", black, 1, 20, FontWeight.w900, "dexter");
    });
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.popAndPushNamed(context, '/onBoarding');
    });
  }
}
