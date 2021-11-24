import 'package:app_matriculas_desktop/models/user.dart';
import 'package:app_matriculas_desktop/screens/buscar.dart';
import 'package:app_matriculas_desktop/screens/home/home.dart';
import 'package:app_matriculas_desktop/screens/wrapper.dart';
import 'package:app_matriculas_desktop/servives/auth.dart';
import 'package:app_matriculas_desktop/widgets/error.dart';
import 'package:app_matriculas_desktop/widgets/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppMatriculasDesktop());
}

class AppMatriculasDesktop extends StatefulWidget {
  const AppMatriculasDesktop({ Key? key }) : super(key: key);

  @override
  _AppMatriculasDesktopState createState() => _AppMatriculasDesktopState();
}

class _AppMatriculasDesktopState extends State<AppMatriculasDesktop> {

  final Future<FirebaseApp> _inicio = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _inicio,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return ErrorPosible();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<MyUser?>.value(
            catchError: (_, err) => null,
            value: AuthService().user,
            initialData: null,
            child: MaterialApp(
              routes: {
                '/wrapper': (context) => Wrapper(),
                '/home': (context) => Home(),
                '/buscar': (context) => Buscar(),
              },
              debugShowCheckedModeBanner: false,
              initialRoute: '/wrapper',
            ),
          );
        }
        return Loading();
      },
    );
  }
}
