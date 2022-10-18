// ignore: must_be_immutable
import 'package:dexter_assignment/bloc/task_bloc.dart';

import '../../Repository/task_repository.dart';
import '../../model/imports/generalImport.dart';
import '../../model/task_model.dart';

Future<void> editTask({
  required context,
}) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController endedTaskAtController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode titleNode = FocusNode();
  final FocusNode endedTaskNode = FocusNode();
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
                'Add a task to ', black, 1, 23, FontWeight.w900, "add",
                textAlign: TextAlign.center),
            GeneralTextDisplay('dexter', red!, 1, 23, FontWeight.w900, "add",
                textAlign: TextAlign.center),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GeneralTextDisplay(
                  'Title of task', red!, 2, 15, FontWeight.w900, "add"),
              S(h: 5),
              Column(
                key: _formKey,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  S(h: 10),
                  addTaskTextAndTextField(
                    context,
                    borderColor: white,
                    textInputType: TextInputType.text,
                    controller: titleController,
                    hint: "Please Enter your task here",
                    labelText: 'Enter your task here',
                    onChanged: () {},
                    inputFormatter: [],
                    prefix: null,
                    suffix: null,
                    focusNode: titleNode,
                    errorTextActive: false,
                  ),
                  S(h: 10),
                  GeneralTextDisplay(
                      'Description Task', red!, 2, 15, FontWeight.w900, "add"),
                  S(h: 10),
                  Container(
                    width: sS(context).cW(width: 327),
                    height: sS(context).cH(height: 200),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                          sS(context).cH(height: 10),
                        )),
                        color: white,
                        border: Border.all(color: textFieldText)),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          maxLines: 5,
                          controller: descriptionController,
                          maxLength: 500,
                          decoration: InputDecoration(
                              focusColor: red,
                              hintText: "Describe your task",
                              hintStyle: TextStyle(color: red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          style: TextStyle(color: red, fontSize: 15),
                        )),
                  ),
                  S(h: 20)
                ],
              )
            ],
          ),
        ),
        actions: [
          TextButton(
              child: Text('Add', style: TextStyle(color: red, fontSize: 20)),
              onPressed: () {
                TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
                taskBloc.add(AddTaskEvent(TaskModel(
                    createdAt: DateTime.now(),
                    title: titleController.text,
                    description: descriptionController.text,
                    status: 'pending',
                    // deadline: DateTime.now(),
                    createdBy: 'userId')));
                TaskBloc(repository: TaskRepository())..add(GetAllTasksEvent());
                Navigator.pushReplacementNamed(context, '/allTask');
                Navigator.of(context).pop();
              }),
          TextButton(
              child: Text('Cancel',
                  style: TextStyle(color: red, fontSize: 20),
                  textAlign: TextAlign.left),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    },
  );
}
