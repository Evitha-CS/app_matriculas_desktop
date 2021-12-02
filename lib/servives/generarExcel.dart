import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:excel/excel.dart';
import 'dart:io';

void generarExcel(BuildContext context) {
  // final matriculas = Provider.of<List<Matricula>?>(context) ?? [];
  String _date = DateTime.now().toString().substring(0, 16);
  CellStyle _bold = CellStyle(bold: true, horizontalAlign: HorizontalAlign.Center);
  CellStyle _center = CellStyle(horizontalAlign: HorizontalAlign.Center);

  final matriculas = List<Matricula>.generate(
    30,
    (int i) => Matricula(
        matricula: 'matricula $i',
        modelo: 'modelo',
        hora: DateTime.now().toString().substring(0, 16),
        marca: 'marca',
        color: 'color',
        entrada: 'E1',
        uid: 'uid',
        sospecha: false,
        salida: true),
  );

  final excel = Excel.createExcel();
  final sheet = excel[excel.getDefaultSheet()!];

  //titulo matriculas
  var _matriculasTitulo =
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0));
  _matriculasTitulo.cellStyle = _bold;
  _matriculasTitulo.value = 'MATRICULA';

//titulo marca
  var _marcasTitulo =
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0));
  _marcasTitulo.cellStyle = _bold;
  _marcasTitulo.value = 'MARCA';

  //titulo modelo
  var _modelosTitulo = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0));
  _modelosTitulo.cellStyle = _bold;
  _modelosTitulo.value = 'MODELO';

  //titulo color
  var _colorTitulo = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0));
  _colorTitulo.cellStyle = _bold;
  _colorTitulo.value = 'COLOR';

  //titulo hora
  var _hora = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0));
  _hora.cellStyle = _bold;
  _hora.value = 'HORA';



  for (int i = 0; i < matriculas.length; i++) {
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 2)).value = '${matriculas[i].matricula}';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 2)).cellStyle = _bold;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 2)).value = '${matriculas[i].marca}';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 2)).cellStyle = _center;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 2)).value = '${matriculas[i].modelo}';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 2)).cellStyle = _center;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 2)).value = '${matriculas[i].color}';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 2)).cellStyle = _center;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 2)).value = '${matriculas[i].hora}';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 2)).cellStyle = _center;
  }

  excel.save(fileName: 'Matriculas-$_date.xlsx');
}
