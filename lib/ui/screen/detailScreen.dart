import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue[100],
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ID = ${widget.id}',
                  style: TextStyle(color: Colors.grey[800], fontSize: 28),
                ),
                ElevatedButton(
                    onPressed: () {
                      // call showContainer from Controlle Class
                      Navigator.pop(context);
                    },
                    child: const Text('Back Home')),
              ],
            ),
          )),
    );
  }
}
