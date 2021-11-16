import 'package:flutter/material.dart';

class ErrorPosible extends StatefulWidget {
  const ErrorPosible({Key? key}) : super(key: key);

  @override
  _ErrorPosibleState createState() => _ErrorPosibleState();
}

class _ErrorPosibleState extends State<ErrorPosible> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Text('Error en la base de datos',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ))),
      ),
    );
  }
}
