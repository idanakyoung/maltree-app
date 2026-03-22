import 'package:flutter/material.dart';
import 'types_screen.dart';

class PartsScreen extends StatelessWidget {
  const PartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('파트 목록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _partButton(context, 'Part 1'),
            const SizedBox(height: 12),
            _partButton(context, 'Part 2'),
            const SizedBox(height: 12),
            _partButton(context, 'Part 3'),
            const SizedBox(height: 12),
            _partButton(context, 'Part 4'),
            const SizedBox(height: 12),
            _partButton(context, 'Part 5'),
          ],
        ),
      ),
    );
  }

  Widget _partButton(BuildContext context, String partName) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypesScreen(partName: partName),
            ),
          );
        },
        child: Text(partName),
      ),
    );
  }
}