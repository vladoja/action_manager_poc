import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen(
      {super.key, required this.label, required this.detailsPath});
  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab root - $label')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Screen $label',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () => GoRouter.of(context).go(detailsPath),
              child: const Text('View details'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.label});
  final String label;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - ${widget.label}'),
        leading: InkWell(
          onTap: () {
            // context.pop();
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            }
            // Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Details for ${widget.label} - Counter: $_counter',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Text('Increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Screen - $label')),
      body: Center(
        child: Text('Screen $label',
            style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
