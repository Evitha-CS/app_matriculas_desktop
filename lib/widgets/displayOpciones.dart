import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget displayOpciones(BuildContext context, String opcion, bool selected) {
  final double alto = MediaQuery.of(context).size.height;
  final double ancho = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
    child: Container(
      height: alto * 0.1,
      decoration: BoxDecoration(
        border: selected? Border.all(color: Colors.white, width: 3): null,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$opcion',
            style: GoogleFonts.ubuntu(
          fontSize: 30,
          color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
