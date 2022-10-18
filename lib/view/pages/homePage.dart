import 'package:dexter_assignment/model/homeModel.dart';
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
  static Color? _avatarColor(int index) {
    switch (index % 4) {
      case 0:
        return pink;
      case 1:
        return Colors.teal;
      case 2:
        return red!;
      case 3:
        return brown;
      default:
        return null;
    }
  }

  static String? _subtitle(int index) {
    switch (index % 4) {
      case 0:
        return 'SlidableScrollActionPane';
      case 1:
        return 'SlidableDrawerActionPane';
      case 2:
        return 'SlidableStrechActionPane';
      case 3:
        return 'SlidableBehindActionPane';
      default:
        return null;
    }
  }

  static String? _position(int index) {
    switch (index % 4) {
      case 0:
        return 'Software Developer';
      case 1:
        return 'Software Testing';
      case 2:
        return 'Software Designer';
      case 3:
        return 'Project Manager';
      default:
        return null;
    }
  }

  final List<HomeModal> items = List.generate(
    11,
    (i) => HomeModal(
      i,
      _position(i)!,
      _subtitle(i)!,
      _avatarColor(i)!,
    ),
  );

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
