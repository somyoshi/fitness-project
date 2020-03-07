import 'dart:async';
import 'package:fitness_gestor/models/aluno.model.dart';
import 'package:fitness_gestor/providers/api.provider.dart';

class AlunoProvider {
  ApiProvider _apiProvider = ApiProvider('alunos');

  Stream<List<AlunoModel>> getAlunos(String campo, dynamic valor) {
    return _apiProvider.streamDataCollectionContains(campo, valor).map((docs) {
      return docs.documents.map((doc) => AlunoModel.map(doc)).toList();
    });
  }

  Stream<List<AlunoModel>> getAlunosWhere(String campo, dynamic valor) {
    return _apiProvider.streamDataCollectionWhere(campo, valor).map((docs) {
      return docs.documents.map((doc) => AlunoModel.map(doc)).toList();
    });
  }

  void create(AlunoModel aluno) {
    _apiProvider.create(aluno.toMap());
  }

  void update(AlunoModel aluno) {
    aluno.reference.updateData(aluno.toMap());
  }

  void delete(AlunoModel aluno) {
   aluno.reference.delete();
  }
}
