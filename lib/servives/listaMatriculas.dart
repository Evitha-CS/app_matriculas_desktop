import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:app_matriculas_desktop/servives/database.dart';
import 'package:app_matriculas_desktop/widgets/displayMatricula.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaMatriculas extends StatefulWidget {
  const ListaMatriculas({Key? key}) : super(key: key);

  @override
  _ListaMatriculasState createState() => _ListaMatriculasState();
}

class _ListaMatriculasState extends State<ListaMatriculas> {
  final _databaseService = DatabaseService();

  Future _borrarMatriculas(int index, List<Matricula> lista) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '¿Desea borrar la matricula?',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(5,30,5,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No Borrar'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[400],
                            elevation: 0,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await _databaseService.borrarMatricula(lista[index].uid);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Borrar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            elevation: 2,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final matriculas = Provider.of<List<Matricula>?>(context) ?? [];

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 100),
      physics: BouncingScrollPhysics(),
      itemCount: matriculas.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: display(context, index, matriculas),
          onLongPress: () async {
            await _borrarMatriculas(index, matriculas);
          },
        );
      },
    );
  }
}