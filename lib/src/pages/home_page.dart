import 'package:app_recarga/src/pages/cardRegisterForm.dart';
import 'package:app_recarga/src/pages/card_page.dart';
import 'package:app_recarga/src/pages/tarjeta_metro_home.dart';
import 'package:app_recarga/src/providers/ui_provider.dart';
import 'package:app_recarga/src/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        //bottomNavigationBar: Menu(),
        body: _HomePageBody());
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return TarjetaMetroHomePage();

      case 1:
        return CardRegisterForm();

      case 2:
        return CardPage();

      default:
        return TarjetaMetroHomePage();
    }
  }
}
