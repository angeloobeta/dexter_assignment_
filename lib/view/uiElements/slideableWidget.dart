import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../bloc/task_bloc.dart';
import '../../model/task_model.dart';
import 'edit_todo.dart';

Widget SlidableWidget(
  BuildContext context,
  TaskModel todoList, {
  required String? title,
  required String? description,
  required String? status,
}) {
  return Slidable(
// Specify a key if the Slidable is dismissible.
    key: const ValueKey(0),
// The start action pane is the one at the left or the top side.
    startActionPane: ActionPane(
// A motion is a widget used to control how the pane animates.
      motion: const ScrollMotion(),

      dismissible: null,

// All actions are defined in the children parameter.
      children: [
// A SlidableAction can have an icon and/or a label.
        SlidableAction(
          onPressed: (context) async {
            TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
            taskBloc.add(DeleteTaskEvent(todoList.id!, todoList));
            Navigator.pushReplacementNamed(context, '/homePage');
            print(todoList.id);
            // TaskBloc(repository: TaskRepository())..add(GetAllTasksEvent());
          },
          backgroundColor: red!,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),

// The end action pane is the one at the right or the bottom side.
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) => editTask(context, todoList),
          backgroundColor: Color(0xFF7BC043),
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        )
      ],
    ),
    child: ListTile(
      title: Text(title!),
      leading: CircleAvatar(
        backgroundColor: textFieldText,
        child: Text(title.substring(0, 2)),
        foregroundColor: red!,
      ),
      isThreeLine: true,
      subtitle: Text(description!),
      trailing: Text(status!),
    ),
  );
}
