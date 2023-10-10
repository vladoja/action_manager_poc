import 'package:action_manager_poc/features/app/domain/entities/person.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/personal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: IconButton(
          onPressed: () {
            _onCreateNewPerson(context);
          },
          icon: const Icon(Icons.add_circle)),
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
    return BlocBuilder<PersonalBloc, PersonalState>(
      builder: (_, state) {
        if (state is PersonalLoading) {
          return Center(
            child: IconButton(
                onPressed: () {
                  _onReloadButtonTapped(context);
                },
                icon: const Icon(Icons.refresh)),
          );
        }
        if (state is PersonalDone) {
          var persons = state.persons;
          if (persons!.isEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          } else {
            return Center(
              child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  return _createPersonTile(context, persons[index]);
                },
              ),
            );
          }
        }

        print("No bloc event catched");
        return const FittedBox(
          child: Icon(Icons.error),
        );
      },
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
                  _onRemovePersonTapped(context, person);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  // _onRemovePersonTapped(context, person);
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

  void _onRemovePersonTapped(BuildContext context, PersonEntity person) {
    BlocProvider.of<PersonalBloc>(context)
        .add(RemovePersonFromPersonal(person));
  }

  void _onReloadButtonTapped(BuildContext context) {
    BlocProvider.of<PersonalBloc>(context).add(const GetPersonal());
  }

  void _onCreateNewPerson(BuildContext context) {
    Navigator.pushNamed(context, '/Personal/New');
  }
}
