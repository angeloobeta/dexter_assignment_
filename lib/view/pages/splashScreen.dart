import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/viewModel/onBoardingViewModel/splashScreen.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        onModelReady: (model) async {
          model.future(context);
        },
        disposeViewModel: false,
        builder: (context, model, child) => baseUi(children: [
              rowPositioned(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      child: model.image),
                  top: 388,
                  left: 98)
            ], allowBackButton: false));
  }
}
