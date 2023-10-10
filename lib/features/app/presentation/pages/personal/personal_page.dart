import 'package:action_manager_poc/features/app/data/models/person.dart';
import 'package:action_manager_poc/temp/dummy_personal.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton:
          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Personal',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: personal_data_temp.length,
      itemBuilder: (context, index) {
        return _createPersonTile(personal_data_temp[index]);
      },
    ));
  }

  _createPersonTile(PersonModel person) {
    return ListTile(
        leading: Column(
          children: [
            Text(
              "${person.firstName!} ${person.lastName}",
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              person.role!,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
        trailing: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  print('Delete clicked');
                  // userListBloc(context).add(DeleteUser(user: user));
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
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
}
