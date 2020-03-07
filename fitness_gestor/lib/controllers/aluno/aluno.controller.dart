import 'package:fitness_gestor/models/aluno.model.dart';
import 'package:fitness_gestor/providers/aluno.provider.dart';
import 'package:mobx/mobx.dart';

part 'aluno.controller.g.dart';

class AlunoController = _AlunoController with _$AlunoController;

abstract class _AlunoController with Store {
  final _alunoProvider = AlunoProvider();

  _AlunoController() {
    getAlunos("nome", '');
  }

  @observable
  ObservableStream<List<AlunoModel>> alunos;

  @action
  getAlunos(String campo, dynamic valor) {
    this.alunos = _alunoProvider.getAlunos(campo, valor).asObservable();
  }

  @action
  getWithWhere(String campo, dynamic valor) {
    this.alunos = _alunoProvider.getAlunosWhere(campo, valor).asObservable();
  }

  @action
  save(AlunoModel aluno) {
    if (aluno.reference == null) {
      _alunoProvider.create(aluno);
    } else {
      _alunoProvider.update(aluno);
    }
  }
}
