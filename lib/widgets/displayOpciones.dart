import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget displayOpciones(BuildContext context, String opcion, bool selected) {
  final double alto = MediaQuery.of(context).size.height;
  final double ancho = MediaQuery.of(context).size.width;

  return Container(
    height: alto * 0.08,
    decoration: BoxDecoration(
      // border: selected? Border.all(color: Colors.black, width: 3): null,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$opcion',
          style: GoogleFonts.ubuntu(
        fontSize: 25,
        color: selected? Colors.black : Colors.grey,
          ),
        ),
      ),
    ),
  );
}
