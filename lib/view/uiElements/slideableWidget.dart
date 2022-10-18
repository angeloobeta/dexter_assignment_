import 'package:dexter_assignment/model/imports/generalImport.dart';

Widget SlidableWidget(BuildContext context,
    {required String? title, String? description}) {
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
      children: const [
// A SlidableAction can have an icon and/or a label.
        SlidableAction(
          onPressed: null,
          backgroundColor: Color(0xFFFE4A49),
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
// An action can be bigger than the others.
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
    child: ListTile(title: Text(title!)),
  );
}
