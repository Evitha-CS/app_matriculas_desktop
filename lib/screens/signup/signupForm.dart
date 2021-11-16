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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
              SizedBox(height: 35),
              //form para correo
              Text(
                'Correo',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff616161),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Escriba el correo' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 25),
              //form para password
              Text(
                'Contraseña',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff616161),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                validator: (val) =>
                    val!.isEmpty ? 'Escriba la contraseña' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
              SizedBox(height: 35),
              Center(
                child: Text(
                  '$error',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Center(
                //boton entrar
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic result =
                          await _auth.signInEmailPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Usuario o contraseña incorrecta';
                        });
                      }
                    }
                  },
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(200, 50),
                    primary: Color(0xff79B4B7),
                    elevation: 0,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
