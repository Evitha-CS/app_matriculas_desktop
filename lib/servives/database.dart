import 'package:app_matriculas_desktop/models/matricula.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference coleccionMatriculas =
      FirebaseFirestore.instance.collection('matriculas');

  Future borrarMatricula(String? uid) async {
    return await coleccionMatriculas.doc(uid).delete();
  }

  List<Matricula> _matriculaFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Matricula(
        matricula: doc.get('matricula').toString(),
        marca: doc.get('marca').toString(),
        hora: doc.get('hora').substring(0, 16),
        modelo: doc.get('modelo').toString(),
        color: doc.get('color').toString(),
        entrada: doc.get('entrada').toString(),
        sospecha: doc.get('sospecha'),
        uid: doc.id.toString(),
      );
    }).toList();
  }

  Stream<List<Matricula>> matriculas() {
    return coleccionMatriculas
        .orderBy('hora', descending: true)
        .snapshots()
        .map(_matriculaFromSnapshot);
  }

  Stream<List<Matricula>> buscarMatriculaNombre(String matriculaNombre) {
    return matriculaNombre.isEmpty
        ? Stream.empty()
        : coleccionMatriculas
            .where('nombre', isGreaterThanOrEqualTo: matriculaNombre)
            .where('nombre', isLessThan: matriculaNombre + 'z')
            .snapshots()
            .map(_matriculaFromSnapshot);
  }

  Stream<List<Matricula>> buscarMatricula(String matriculaId) {
    return matriculaId.isEmpty
        ? Stream.empty()
        : coleccionMatriculas
            .where('matricula', isGreaterThanOrEqualTo: matriculaId)
            .where('matricula', isLessThan: matriculaId + 'z')
            .snapshots()
            .map(_matriculaFromSnapshot);
  }
}