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
    const CompletedTask(),
    const PendingTask(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return mainUi(context,
        children: [
          Center(
            child: _pages.elementAt(_selectedIndex),
          ),
        ],
        allowBackButton: false,
        onTapFunction: _onItemTapped);
  }
}
