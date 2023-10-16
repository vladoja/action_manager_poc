import 'package:flutter/material.dart';

class ActionPersonalWidget extends StatelessWidget {
  const ActionPersonalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> data = ['First', 'Second', 'Three'];
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: data.length,
        // controller: scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          );
        },
      ),
    );
  }
}
