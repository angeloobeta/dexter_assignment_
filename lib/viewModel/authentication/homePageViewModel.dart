import '../../model/imports/generalImport.dart';
import '../baseModel.dart';

class HomePageViewModel extends BaseModel {
// hiding the user icon
  bool obscureText = true;

  changeObscurity() {
    obscureText = !obscureText;
    notifyListeners();
  }

// for advanced drawer
  final advancedDrawerController = AdvancedDrawerController();

// for draggableScrollable sheet
  DraggableScrollableController draggableSheetController =
      DraggableScrollableController();

  // controlling draggable sheet through controller
  bool isUp = true;

  resetIsUp() {
    isUp = !isUp;
    notifyListeners();
  }

  setIsUp(value) {
    isUp = value;
    notifyListeners();
  }
}
