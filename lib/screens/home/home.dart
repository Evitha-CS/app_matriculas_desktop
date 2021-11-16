import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:app_matriculas_desktop/servives/auth.dart';
import 'package:app_matriculas_desktop/servives/database.dart';
import 'package:app_matriculas_desktop/servives/listaMatriculas.dart';
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
  int _indexMenu = 0;

  final List<Color> _colores = [
    Color(0xff3D56B2), //appbar y bottom bar
    Colors.white //fondo scaffold
  ];
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  void _onTap(index) {
    if (index == 1) {
      _auth.signOut();
    }
    if (index == 0) {
      Navigator.pushNamed(context, '/buscar');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Matricula>?>.value(
      value: DatabaseService().matriculas(),
      initialData: null,
      catchError: (_, err) => null,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _colores[1],
        //appbar
        appBar: AppBar(
            title: Text(
              'Matriculas',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            // centerTitle: true,
            elevation: 0,
            backgroundColor: _colores[0]),
        //body
        body: _loading
            ? SpinKitFadingCircle(
                color: Colors.red[800],
                size: 100,
              )
            : ListaMatriculas(),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          color: _colores[0],
          elevation: 0,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Cerrar Sesión',
              ),
            ],
            currentIndex: _indexMenu,
            onTap: _onTap,
          ),
        ),
      ),
    );
  }
}