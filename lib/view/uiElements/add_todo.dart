// ignore: must_be_immutable
import '../../model/imports/generalImport.dart';

Future<void> showMyDialog({
  required context,
}) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  print("");
  print("");
  print("Alert Dialog was pressed");
  print("");
  print("");
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
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
                  ElevatedButton(
                    onPressed: () {},
                    child: descriptionController.text == ''
                        ? Text(
                            'Add Todo',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                            'Update todo',
                            style: TextStyle(color: Colors.white),
                          ),
                  )
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
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
