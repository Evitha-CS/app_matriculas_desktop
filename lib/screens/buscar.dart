import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:app_matriculas_desktop/servives/database.dart';
import 'package:app_matriculas_desktop/widgets/displayMatricula.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Buscar extends StatefulWidget {
  const Buscar({Key? key}) : super(key: key);

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  bool _nombre = true;
  String? _buscar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Buscar Matricula',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color(0xff3D56B2),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  hintText: _nombre ? 'Ingrese nombre' : 'Ingrese matricula',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onChanged: (val) {
                setState(() {
                  if (_nombre) {
                    _buscar = val;
                  } else {
                    _buscar = val.toUpperCase();
                  }
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Buscar por matricula',
              ),
              Switch(
                  activeColor: Color(0xff3D56B2),
                  inactiveThumbColor: Color(0xff3D56B2),
                  activeTrackColor: Colors.grey,
                  inactiveTrackColor: Colors.grey,
                  value: _nombre,
                  onChanged: (val) {
                    setState(() {
                      _nombre = !_nombre;
                    });
                  }),
              Text(
                'Buscar por nombre',
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          StreamProvider<List<Matricula>?>.value(
            value: _nombre
                ? DatabaseService().buscarMatriculaNombre(_buscar.toString())
                : DatabaseService().buscarMatricula(_buscar.toString()),
            initialData: null,
            catchError: (_, err) => null,
            child: Builder(builder: (context) {
              final matriculas = Provider.of<List<Matricula>?>(context) ?? [];
              if (matriculas.isEmpty) {
                return SpinKitRipple(
                  color: Colors.green,
                  size: 150,
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 100),
                    physics: BouncingScrollPhysics(),
                    itemCount: matriculas.length,
                    itemBuilder: (context, index) {
                      return display(context, index, matriculas);
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
