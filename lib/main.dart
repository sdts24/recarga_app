import 'package:app_recarga/src/pages/cardRegisterForm.dart';
import 'package:app_recarga/src/pages/home_page.dart';
import 'package:app_recarga/src/pages/loginForm.dart';
import 'package:app_recarga/src/pages/registerForm.dart';
import 'package:app_recarga/src/pages/tarjeta_metro_home.dart';
import 'package:app_recarga/src/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //debugPrint = (String message, {int wrapWidth}) {};
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        title: 'Recarga App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginForm(),
          'registro': (BuildContext context) => RegisterForm(),
          'tarjeta': (BuildContext context) => CardRegisterForm(),
          'inicioMetro': (BuildContext context) => TarjetaMetroHomePage(),
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
