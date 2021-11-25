import 'package:flutter/rendering.dart';

class EntradasUni {
  String? entrada;
  Color? color;

  EntradasUni({this.color, this.entrada});
}

List<EntradasUni> entradas = [
  EntradasUni(entrada: 'E1', color: Color(0xffB5EAEA)),
  EntradasUni(entrada: 'E2', color: Color(0xffFBAFAF)),
  EntradasUni(entrada: 'E3', color: Color(0xff99DDCC)),
  EntradasUni(entrada: 'E4', color: Color(0xffEADEDE)),
  EntradasUni(entrada: 'E5', color: Color(0xffF2AE72)),
];