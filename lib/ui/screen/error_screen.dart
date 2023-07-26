import 'package:flutter/material.dart';

class ErrorPathScreen extends StatelessWidget {
  const ErrorPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[100],
        child: Center(
            child: Text(
          'Error No Page',
          style: TextStyle(color: Colors.red[400], fontSize: 18),
        )),
      ),
    );
  }
}
