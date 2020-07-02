import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) => ListTile(
          leading: Text('Trying'),
        ),
        itemCount: 10,
      ),
    );
  }
}
