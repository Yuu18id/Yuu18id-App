import 'package:flutter/material.dart';

class OperatorPage extends StatelessWidget {
  const OperatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("He'd have you all unravel at the"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[200],
            child: const Text('Heed not the rabble'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[300],
            child: const Text('Sound of screams but the'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[400],
            child: const Text('Who scream'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[500],
            child: const Text('Revolution is coming...'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[600],
            child: const Text('Revolution, they...'),
          ),
          Container(
            
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                boxShadow: [
      BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //
    ],
              image: const DecorationImage(
                image: NetworkImage('assets/op_avatar/char_003_kalts.png'),
                fit: BoxFit.cover,
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
