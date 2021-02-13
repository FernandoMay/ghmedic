import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghmedic/empleado.dart';
import 'package:ghmedic/home.dart';
import 'package:ghmedic/textstyles.dart';
import 'package:ghmedic/utils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  String errinski;
  Color hoverColor;
  bool callejonactivo = false;

  String getError(String acceso) {
    switch (acceso) {
      case "FirebaseError: The password is invalid or the user does not have a password. (auth/wrong-password)":
        return "La contraseña es incorrecta";
      case "FirebaseError: There is no user record corresponding to this identifier. The user may have been deleted. (auth/user-not-found)":
        return "Usuario no registrado";
      default:
        return acceso;
    }
  }

  String emailValidator(String value) {
    if (value.length < 3) {
      return 'Ingresa tu usuario correctamente';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'La contraseña debe contener mínimo 8 carácteres';
    } else {
      return null;
    }
  }

  Future<Response> getUsuario() async {
    final String _endpoint = "http://erpghmedic.com.mx/flutter/";
    final Dio _dio = Dio();

    if (_loginFormKey.currentState.validate()) {
      Response response = await _dio.get(_endpoint, queryParameters: {
        "usuario": emailInputController.value.text,
        "password": pwdInputController.value.text,
      });
      if (response == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    hoverColor = primaryColor;
    emailInputController = TextEditingController();
    pwdInputController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          Container(
            // width: MediaQuery.of(context).size.width * 0.9,
            // height: MediaQuery.of(context).size.width > 800 ? 560 : 982,
            child: Form(
              key: _loginFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 64.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Hola,",
                            style: germanicomed,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Bienvenido",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 64.0,
                    ),
                    Container(
                      child: Image.asset("lib/assets/ghmedic.png"),
                      height: 64,
                    ),
                    SizedBox(
                      height: 64.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        cursorColor: secondaryColor,
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          hintText: "Ingresa tu usuario",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: secondaryLightColor,
                            ),
                          ),
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          hoverColor: Colors.blue,
                        ),
                        controller: emailInputController,
                        keyboardType: TextInputType.text,
                        validator: emailValidator,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        //horizontal: MediaQuery.of(context).size.width * 0.1,
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: TextFormField(
                          cursorColor: secondaryColor,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            hintText: "Ingresa tu contraseña",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: secondaryLightColor,
                              ),
                            ),
                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            hoverColor: Colors.blue,
                          ),
                          controller: pwdInputController,
                          obscureText: true,
                          validator: pwdValidator,
                          onFieldSubmitted: (c) {}),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 13,
            left: 60,
            right: 60,
            child: ElevatedButton(
              onPressed: () => getUsuario(),
              child: Text(
                "Ingresar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 64,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
