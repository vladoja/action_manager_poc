import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Action Manager POC',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: const Text('Personal'),
          onTap: () => _tapOnPersonal(context),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () => {_gotoPageAkce(context)},
            child: const Text('Akcie'))
      ],
    ));
  }

  _tapOnPersonal(BuildContext context) {
    Navigator.pushNamed(context, '/Personal');
  }

  _gotoPageAkce(BuildContext context) {
    Navigator.pushNamed(context, '/Akcie');
  }
}
