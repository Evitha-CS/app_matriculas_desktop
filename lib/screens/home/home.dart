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
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;

    return StreamProvider<List<Matricula>?>.value(
      value: DatabaseService().matriculas(),
      initialData: null,
      catchError: (_, err) => null,
      child: Scaffold(
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
            elevation: 0,
            backgroundColor: Color(0xff3D56B2)),
        //body
        body: _loading
            ? SpinKitFadingCircle(
                color: Colors.red[800],
                size: 100,
              )
            : Row(
              children: [
                Expanded(child: ListaMatriculas()),
                Container(
                  width: ancho * 0.4,
                  color: Colors.green,
                )
              ],
            ),
        extendBody: true,
        // bottomNavigationBar: BottomAppBar(
        //   color: Color(0xff3D56B2),
        //   elevation: 0,
        //   child: BottomNavigationBar(
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //     selectedItemColor: Colors.white,
        //     unselectedItemColor: Colors.white,
        //     items: [
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.search),
        //         label: 'Buscar',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.logout),
        //         label: 'Cerrar Sesión',
        //       ),
        //     ],
        //     currentIndex: _indexMenu,
        //     onTap: _onTap,
        //   ),
        // ),
      ),
    );
  }
}