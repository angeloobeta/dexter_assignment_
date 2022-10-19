import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/view/pages/task/allTask.dart';
import 'package:dexter_assignment/view/pages/task/completedTask.dart';
import 'package:dexter_assignment/view/pages/task/pendingTask.dart';
import 'package:dexter_assignment/view/uiElements/add_todo.dart';
import 'package:dexter_assignment/view/uiElements/bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const AllTask(),
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
            onPressed: () => showMyDialog(
              context: context,
            ),
            child: Icon(Icons.add),
          ),
          body: Container(
            color: grey,
            width: double.infinity,
            child: _pages.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: bottomNavigationBar(context,
              selectedIndex: _selectedIndex, onItemTapped: (value) {
            _onItemTapped(value);
          }, items: listOfNavigationIcon)),
    );
  }
}
