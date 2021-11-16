import 'package:app_matriculas_desktop/models/entradas.dart';
import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:flutter/material.dart';

Widget display(BuildContext context, int index, List<Matricula> lista) {
  final double alto = MediaQuery.of(context).size.height;
  final double ancho = MediaQuery.of(context).size.width;

  EntradasUni _entrada =
      entradas.firstWhere((e) => e.entrada == lista[index].entrada);

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
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
                radius: alto * 0.045,
                child: Center(
                  child: Text(
                    '${_entrada.entrada}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Matricula texto etc
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
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            '${lista[index].hora.toString()}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        '${lista[index].marca.toString()} - ${lista[index].modelo.toString()} (${lista[index].color.toString()})',
                        style: TextStyle(fontSize: 15),
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
