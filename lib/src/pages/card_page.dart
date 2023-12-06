import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _crearBoton(),
    );
  }

  Widget _crearBoton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
      onPressed: () {
        Navigator.pushNamed(context, 'tarjeta');
      },
    );
  }
}
