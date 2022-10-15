import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/view/pages/task/AllTodoTask.dart';
import 'package:dexter_assignment/view/pages/task/completedTask.dart';
import 'package:dexter_assignment/view/pages/task/pendingTask.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const AllTodoTask(),
    const AllTodoTask(),
    const PendingTask(),
    const CompletedTask(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: red,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Container(
          color: grey,
          width: double.infinity,
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: white,
          unselectedItemColor: red,
          selectedItemColor: grey,
          selectedFontSize: 15.0,
          unselectedFontSize: 12.0,
          selectedIconTheme: IconThemeData(color: grey),
          unselectedIconTheme: IconThemeData(color: red),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fact_check_outlined,
                  size: 50,
                ),
                label: "All Task"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pending_actions_rounded,
                  size: 50,
                ),
                label: "Pending"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.done,
                  size: 50,
                ),
                label: "Completed")
          ],
        ),
      ),
    );

    //   mainUi(
    //   children: [
    //     Center(
    //       child: _pages.elementAt(_selectedIndex),
    //     ),
    //   ],
    //   allowBackButton: false,
    //   // onTapFunction: (){}
    // );
  }
}
