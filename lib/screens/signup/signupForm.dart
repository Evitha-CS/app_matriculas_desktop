import 'package:app_matriculas_desktop/servives/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String error = '';

  final _formkey = GlobalKey<FormState>();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('spikes.png'), repeat: ImageRepeat.repeat),
          //Background pattern from Toptal Subtle Patterns
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3, color: Colors.grey),
                color: Colors.white,
              ),
              width: ancho * 0.28,
              height: alto * 0.52,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //titulo
                      Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      //form para correo
                      Text(
                        'Correo',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff616161),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'Escriba el correo' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      //form para password
                      Text(
                        'Contraseña',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff616161),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'Escriba la contraseña' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        onFieldSubmitted: (val) async {
                          if (_formkey.currentState!.validate()) {
                            dynamic result = await _auth.signInEmailPassword(
                                email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Usuario o contraseña incorrecta';
                              });
                            }
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Text(
                          '$error',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        //boton entrar
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              dynamic result = await _auth.signInEmailPassword(
                                  email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Usuario o contraseña incorrecta';
                                });
                              }
                            }
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            minimumSize: Size(250, 70),
                            primary: Color(0xff3D56B2),
                            elevation: 0,
                            shape: StadiumBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
