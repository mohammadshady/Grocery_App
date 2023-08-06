import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'User Screen',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
    );
  }
}
