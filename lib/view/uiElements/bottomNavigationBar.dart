import 'package:dexter_assignment/model/imports/generalImport.dart';

Widget bottomNavigationBar(BuildContext context,
    {required List<BottomNavigationBarItem> items,
    required VoidCallback? onItemTapped(int),
    required int selectedIndex}) {
  return BottomNavigationBar(
      currentIndex: selectedIndex,
      backgroundColor: white,
      unselectedItemColor: red,
      selectedItemColor: grey,
      selectedFontSize: 15.0,
      unselectedFontSize: 12.0,
      selectedIconTheme: IconThemeData(color: grey),
      unselectedIconTheme: IconThemeData(color: red),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onItemTapped,
      items: items);
}

const List<BottomNavigationBarItem> listOfNavigationIcon = [
  BottomNavigationBarItem(
      icon: Icon(Icons.fact_check_outlined, size: 50), label: "All Task"),
  BottomNavigationBarItem(
      icon: Icon(Icons.pending_actions_rounded, size: 50), label: "Pending"),
  BottomNavigationBarItem(icon: Icon(Icons.done, size: 50), label: "Completed")
];
