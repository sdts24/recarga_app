import 'package:flutter/material.dart';

class TarjetaMetroHomePage extends StatefulWidget {
  @override
  _TarjetaMetroHomePageState createState() => _TarjetaMetroHomePageState();
}

class _TarjetaMetroHomePageState extends State<TarjetaMetroHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Aqui se mostraran las tarjetas del metro registradas'),
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
