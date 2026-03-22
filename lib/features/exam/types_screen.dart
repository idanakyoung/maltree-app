import 'package:flutter/material.dart';

class TypesScreen extends StatelessWidget {
  final String partName;

  const TypesScreen({super.key, required this.partName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$partName 유형 목록'),
      ),
      body: Center(
        child: Text('$partName 유형 목록 화면'),
      ),
    );
  }
}