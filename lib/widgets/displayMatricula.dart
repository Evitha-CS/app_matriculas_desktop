import 'package:app_matriculas_desktop/models/entradas.dart';
import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:flutter/material.dart';

Widget displayMatricula(BuildContext context, int index, List<Matricula> lista) {
  final double alto = MediaQuery.of(context).size.height;
  final double ancho = MediaQuery.of(context).size.width;

  EntradasUni _entrada =
      entradas.firstWhere((e) => e.entrada == lista[index].entrada);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Container(
      width: ancho * 0.8,
      height: alto * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff90AACB), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: _entrada.color,
                radius: alto * 0.055,
                child: Center(
                  child: Text(
                    '${_entrada.entrada}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Matricula texto y hora
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${lista[index].matricula.toString()}',
                            style: TextStyle(
                              color: lista[index].sospecha!
                                  ? Colors.red
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            lista[index].salida!
                                ? '\u{2B07} Vehículo saliendo'
                                : '\u{2B06} Vehículo entrando',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            '${lista[index].hora.toString()}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      // desc del vehiculo
                      Text(
                        '${lista[index].marca.toString()} - ${lista[index].modelo.toString()} (${lista[index].color.toString()})',
                        style: TextStyle(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
