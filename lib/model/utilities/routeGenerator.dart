import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/view/pages/homePage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case '/':
        return materialPage(settings, const CreateAccount());

      // authentication pages
      case '/createAccount':
        return materialPage(settings, const CreateAccount());
      case '/onBoarding':
        return materialPage(settings, const OnBoardingPage());
      case '/signIn':
        return materialPage(settings, const SignIn());
      case '/homePage':
        return materialPage(settings, const HomePage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No page Route'),
        ),
        body: const Center(
          child: Text(
              'The page you tab either had no page route or the route is incorrect'),
        ),
      );
    });
  }
}
