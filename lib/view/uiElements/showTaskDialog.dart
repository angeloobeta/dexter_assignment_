import '../../model/imports/generalImport.dart';
import '../../model/task_model.dart';

Future<void> showTaskDialog(BuildContext context, TaskModel todoList) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode titleNode = FocusNode();
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GeneralTextDisplay(
                'Task Details ', black, 1, 23, FontWeight.w900, "add",
                textAlign: TextAlign.center),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GeneralTextDisplay(
                  'Title of task', red!, 2, 18, FontWeight.w900, "add"),
              GeneralTextDisplay(
                  todoList.title!, black, 2, 15, FontWeight.w900, "add"),
              S(h: 15),
              S(h: 10),
              GeneralTextDisplay(
                  'Description Task', red!, 2, 18, FontWeight.w900, "show"),
              S(h: 10),
              GeneralTextDisplay(
                  todoList.description!, black, 7, 15, FontWeight.w900, "show"),
              S(h: 10),
              S(h: 20)
            ],
          ),
        ),
        actions: [
          TextButton(
              child: Text('Close',
                  style: TextStyle(color: red, fontSize: 20),
                  textAlign: TextAlign.center),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    },
  );
}
