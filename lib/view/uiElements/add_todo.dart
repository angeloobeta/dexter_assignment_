// ignore: must_be_immutable
import 'package:dexter_assignment/bloc/task_bloc.dart';

import '../../model/imports/generalImport.dart';
import '../../model/task_model.dart';

Future<void> showMyDialog({
  required context,
}) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
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
                'Title of task',
                black,
                2,
                15,
                FontWeight.w900,
                "add",
              ),
              Column(
                key: _formKey,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (input) =>
                        input!.isEmpty ? 'Please enter a title' : null,
                    controller: titleController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Enter title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (input) =>
                        input!.isEmpty ? 'Please enter a description' : null,
                    controller: descriptionController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Enter Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: descriptionController.text == ''
                  //       ? Text(
                  //           'Add Todo',
                  //           style: TextStyle(color: Colors.white),
                  //         )
                  //       : Text(
                  //           'Update todo',
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  // )
                ],
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
              taskBloc.add(AddTaskEvent(TaskModel(
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                title: titleController.text,
                description: descriptionController.text,
                status: 'pending',
                deadline: DateTime.now(),
                createdBy: 'userId',
              )));
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
