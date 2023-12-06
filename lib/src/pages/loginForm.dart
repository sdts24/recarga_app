import 'package:app_recarga/src/models/user_register_model.dart';
import 'package:app_recarga/src/providers/registro_provider.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final usersProvider = UsersProvider();

  UserRegister usuario = UserRegister();

  //TextEditingController _inputDateController = TextEditingController();

  @override
  void dispose() {
    //_inputDateController.dispose();
    super.dispose();
  }

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
                const Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                  ),
                ),
                const Text('Sistema electrónico de recargas.'),
                const SizedBox(height: 30.0),
                _crearMail(),
                const SizedBox(height: 20.0),
                _crearPassword(),
                const SizedBox(height: 20.0),
                _crearBotoniniciarSesion(),
                const SizedBox(height: 20.0),
                _crearBotonCrearCuenta(),
              ],
            ),
          ),
        ),
      ),
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

  Widget _crearMail() {
    return TextFormField(
      initialValue: usuario.email,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
      onSaved: (value) {
        usuario.email = value.toString().trim();
      },
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Ingrese un Correo Valido';
        } else {
          return null;
        }
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
      ),
      onSaved: (value) {
        usuario.contrasena = value.toString().trim();
      },
      validator: (value) {
        if (value!.isEmpty || value.length < 8) {
          return 'Ingrese una contraseña correcta (min 8)';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBotoniniciarSesion() {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        onPressed: _submitInicioSesion,
        child: const Text(
          'Iniciar Sesión',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ));
  }

  /* void _submitInicioSesion() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      usersProvider.login(usuario);
      Navigator.popAndPushNamed(context, 'home');
    }
  }*/

  void _submitInicioSesion() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      // Esperar la respuesta de la función login
      bool loginSuccess = await usersProvider.login(usuario);

      if (loginSuccess) {
        // Iniciar sesión exitosa, navegar a la pantalla 'home'
        print('Bienvenido');
        Navigator.popAndPushNamed(context, 'home');
      } else {
        // Iniciar sesión fallida, mostrar un mensaje de error o tomar otras acciones
        print('Credenciales inválidas');
      }
    }
  }

  Widget _crearBotonCrearCuenta() {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        onPressed: _submitCrearCuenta,
        child: const Text(
          'Crear Cuenta',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ));
  }

  void _submitCrearCuenta() {
    Navigator.pushNamed(context, 'registro');
  }
}
