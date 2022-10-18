import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget SlidableWidget(BuildContext context,
    {required String? title,
    required String? description,
    required String? status}) {
  return Slidable(
// Specify a key if the Slidable is dismissible.
    key: const ValueKey(0),
// The start action pane is the one at the left or the top side.
    startActionPane: ActionPane(
// A motion is a widget used to control how the pane animates.
      motion: const ScrollMotion(),

// A pane can dismiss the Slidable.
      dismissible: null,

// All actions are defined in the children parameter.
      children: [
// A SlidableAction can have an icon and/or a label.
        SlidableAction(
          onPressed: null,
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
          flex: 2,
          onPressed: null,
          backgroundColor: Color(0xFF7BC043),
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        )
      ],
    ),

// The child of the Slidable is what the user sees when the
// component is not dragged.
//     child: GeneralTextDisplay(title!,
//         black,
//         2,
//         16,
//         FontWeight.w700,
//         "")
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
//     child: Container(
//       color: transparent,
//       height: 90.0,
//       width: 90.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         // mainAxisSize: MainAxisSize.max,
//         children: [
//           Expanded(
//             child: CircleAvatar(
//               backgroundColor: textFieldText,
//               child: Text(title!.substring(0, 2)),
//               foregroundColor: red!,
//             ),
//           ),
//           Expanded(
//             child: Text(
//               description!,
//               style: TextStyle(color: red!),
//             ),
//           ),
//         ],
//       ),
//     ),
    // child: ListTile(
    //     title: Text(
    //   title!,
    //   style: TextStyle(color: black),
    // )),
  );
}
