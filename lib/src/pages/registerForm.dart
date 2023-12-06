import 'package:app_recarga/src/models/user_register_model.dart';
import 'package:app_recarga/src/providers/registro_provider.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  final usersProvider = UsersProvider();

  UserRegister usuario = UserRegister();

  @override
  void dispose() {
    //_inputDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: Menu(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 60.0),
                _crearLogo(),
                const SizedBox(height: 50.0),
                const Text('Sistema electrónico de recargas.'),
                const SizedBox(height: 30.0),
                _crearNombreUsuario(),
                const SizedBox(height: 20.0),
                _crearMail(),
                const SizedBox(height: 20.0),
                _crearPassword(),
                const SizedBox(height: 20.0),
                //_crearUsuario(),
                //const SizedBox(height: 20.0),
                _terminosCondiciones(),
                const SizedBox(height: 20.0),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _terminosCondiciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked ??
              false, // Utiliza el valor actual de isChecked o predetermina a false si es nulo
          onChanged: (value) {
            setState(() {
              isChecked = value ??
                  false; // Asigna el valor actual o predetermina a false si es nulo
              usuario.terminoCondicion = isChecked;
            });
          },
        ),
        const Text('Aceptar términos y condiciones'),
      ],
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

  Widget _crearNombreUsuario() {
    return TextFormField(
      initialValue: usuario.nombreUsuario,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Nombre de Usuario',
        prefixIcon: Icon(Icons.person),
        /* border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
      ),
      onSaved: (value) => usuario.nombreUsuario = value.toString(),
      validator: (value) {
        if (value!.isEmpty || value.length < 4) {
          return 'Ingrese su Nombre (min 4 Caracteres)';
        } else {}
      },
    );
  }

  Widget _crearMail() {
    return TextFormField(
      initialValue: usuario.email,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        /* border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
      ),
      onSaved: (value) => usuario.email = value.toString(),
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Ingrese un Correo Valido';
        } else {}
      },
    );
  }

  Widget _crearPassword() {
    return TextFormField(
      initialValue: usuario.contrasena,
      keyboardType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
        prefixIcon: Icon(Icons.key),
        /* border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
      ),
      onSaved: (value) => usuario..contrasena = value.toString(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese una contraseña correcta (min 8)';
        } else {}
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
          'Crear Cuenta',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ));
  }

  void _submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      usersProvider.crearUser(usuario);
    }
  }
}
