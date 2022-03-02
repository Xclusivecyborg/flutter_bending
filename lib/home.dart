import 'package:flutter/material.dart';

class  HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key,required  this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child : Text(
          text,
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
