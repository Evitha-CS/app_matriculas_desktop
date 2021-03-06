import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:app_matriculas_desktop/screens/buscar.dart';
import 'package:app_matriculas_desktop/servives/auth.dart';
import 'package:app_matriculas_desktop/servives/database.dart';
import 'package:app_matriculas_desktop/servives/generarExcel.dart';
import 'package:app_matriculas_desktop/servives/listaMatriculas.dart';
import 'package:app_matriculas_desktop/widgets/displayOpciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  bool _loading = false;
  bool _buscar = false;
  int _indexMenu = 0;

  // void _onTap(index) {
  //   if (index == 1) {
  //     _auth.signOut();
  //   }
  //   if (index == 0) {
  //     Navigator.pushNamed(context, '/buscar');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      //appbar
      appBar: AppBar(
          title: Text(
            'Matriculas Estacionamiento UBB',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Color(0xff3D56B2)),
      //body
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('papyrus.png'), repeat: ImageRepeat.repeat)
        ),
        child: _loading
            ? SpinKitFadingCircle(
                color: Colors.red[800],
                size: 100,
              )
            : Row(
                children: [
                  Container(
                    width: ancho * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            right: BorderSide(color: Colors.black, width: 2))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: SizedBox(
                            height: alto * 0.2,
                            child: Image(
                              image: AssetImage('logo-ubb.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          child: displayOpciones(
                              context, 'Lista Matr??culas', !_buscar),
                          onTap: () {
                            _buscar = false;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          child: displayOpciones(
                              context, 'Buscar Matr??culas', _buscar),
                          onTap: () {
                            _buscar = true;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          child: displayOpciones(context, 'Generar Excel', false),
                          onTap: () {
                            generarExcel(context);
                          },
                        ),
                        Divider(),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              child: displayOpciones(
                                  context, 'Cerrar Sesi??n', false),
                              onTap: () async {
                                await _auth.signOut();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buscar
                      ? Buscar()
                      : Expanded(
                          child: Center(
                            child: SizedBox(
                              width: ancho * 0.5,
                              child: Column(
                                children: [
                                  Expanded(child: ListaMatriculas()),
                                  // Expanded(
                                  //   child: StreamProvider<List<Matricula>?>.value(
                                  //       value: DatabaseService().matriculas(),
                                  //       initialData: null,
                                  //       catchError: (_, err) => null,
                                  //       child: ListaMatriculas()),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
      ),
      extendBody: true,
    );
  }
}
