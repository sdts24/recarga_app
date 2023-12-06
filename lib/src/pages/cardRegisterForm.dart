import 'package:app_recarga/src/models/card_register_model.dart';
import 'package:app_recarga/src/providers/registro_tarjetas_provider.dart';
import 'package:flutter/material.dart';

class CardRegisterForm extends StatefulWidget {
  @override
  _CardRegisterFormState createState() => _CardRegisterFormState();
}

class _CardRegisterFormState extends State<CardRegisterForm> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  TarjetasProvider tarjetasProvider = TarjetasProvider();
  CardRegister tarjeta = CardRegister();

  List<String> dropdownItems = [
    'Banco Popular Dominicano',
    'Banco Promerica',
    'Banco del Reservas',
    'Banco BHD Leon',
    'Scotiabank',
    'Banco Santa Cruz',
    'Banco Caribe',
    'Asociacion Popular',
    'Asociacion La Nacional',
  ];

  String dropdownValue = 'Banco Popular Dominicano';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 60.0),
                _crearLogo(),
                const SizedBox(height: 20.0),
                const Text('Sistema electrónico de recargas.'),
                const SizedBox(height: 30.0),
                _crearDropdown(context),
                const SizedBox(height: 30.0),
                _crearTitular(),
                _crearTarjeta(),
                _crearFecha(), // Agregado _crearFecha
                _crearCVV(), // Agregado _crearCVV
                const SizedBox(height: 30.0),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearTitular() {
    return TextFormField(
      initialValue: tarjeta.titularTarjeta,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Titular de la tarjeta',
        prefixIcon: Icon(Icons.person),
        /* border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
      ),
      onSaved: (value) => tarjeta.titularTarjeta = value.toString(),
      validator: (value) {
        if (value!.isEmpty || value.length < 10) {
          return 'Ingrese su Nombre como esta en la tarjeta';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearTarjeta() {
    return TextFormField(
      initialValue: tarjeta.numeroTarjeta.toString(),
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Número de Tarjeta',
        prefixIcon: Icon(Icons.credit_card),
        /* border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
      ),
      onSaved: (value) {
        tarjeta.numeroTarjeta = int.parse(value.toString());
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese Su Número Tarjeta Valido';
        } else if (value.length < 10) {
          return 'El número debe tener al menos 16 dígitos';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearLogo() {
    return Container(
      child: Image.asset(
        'assets/Logo.png',
        height: 150.0,
        width: 150.0,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _crearDropdown(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      decoration: const InputDecoration(
          labelText: 'Seleccione Entidad Bancaria',
          prefixIcon: Icon(Icons.arrow_drop_down)),
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue ?? '';
          tarjeta.entidadBancaria = dropdownValue.toString();
        });
      },
      items: dropdownItems.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  // Resto del código

  Widget _crearFecha() {
    return TextFormField(
      initialValue: tarjeta.fechaVencimiento,
      keyboardType: TextInputType.datetime,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Fecha Vencimiento',
        prefixIcon: Icon(Icons.date_range),
      ),
      onSaved: (value) => tarjeta.fechaVencimiento = value.toString(),
      validator: (value) {
        if (value!.isEmpty || value.length != 4) {
          return 'Ingrese una Fecha Vencimiento Valida de 4 Digitos';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearCVV() {
    return TextFormField(
      initialValue: tarjeta.cvv.toString(),
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'CVV',
        prefixIcon: Icon(Icons.date_range),
      ),
      onSaved: (value) {
        tarjeta.cvv = int.parse(value.toString());
      },
      validator: (value) {
        if (value!.isEmpty || value.length != 3) {
          return 'Ingrese CVV Valido de 3 Digitos';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
      onPressed: _submit,
      child: const Text(
        'Registrar Tarjeta',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  void _submit() {
    if (formKey.currentState!.validate()) {
      // Lógica para el envío de datos
    }
  }
}
