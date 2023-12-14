import '../../../../domain/entities/person/person.dart';
import '../../../widgets/confirmation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActionShowPersonalWidget extends StatelessWidget {
  final List<PersonEntity> personal;
  const ActionShowPersonalWidget({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Personal: ${personal.length}'),
        ListView.builder(
          itemCount: personal.length,
          physics: const ScrollPhysics(), // add this
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _createPersonTile(context, personal[index]);
          },
        )
      ],
    );
  }

  _createPersonTile(BuildContext context, PersonEntity person) {
    return ListTile(
        leading: Column(
          children: [
            Text(
              "${person.firstName!} ${person.lastName}",
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              person.role.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
        trailing: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  debugPrint('Delete clicked');
                  final confirmed = await showDialog(
                    context: context,
                    builder: (context) => const ConfirmationWidget(
                        questionTitle: "Naozaj zmazat ?",
                        questionDescription:
                            "Naozaj zmazat osobu z personalu?"),
                  );
                  if (confirmed == true) {
                    _onRemovePersonTapped(context, person);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  // _onEditPersonTapped(context, person);
                },
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ));
  }

  void _onRemovePersonTapped(BuildContext context, PersonEntity person) {}
}
