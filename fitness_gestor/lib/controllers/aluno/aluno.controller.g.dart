// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlunoController on _AlunoController, Store {
  final _$alunosAtom = Atom(name: '_AlunoController.alunos');

  @override
  ObservableStream<List<AlunoModel>> get alunos {
    _$alunosAtom.context.enforceReadPolicy(_$alunosAtom);
    _$alunosAtom.reportObserved();
    return super.alunos;
  }

  @override
  set alunos(ObservableStream<List<AlunoModel>> value) {
    _$alunosAtom.context.conditionallyRunInAction(() {
      super.alunos = value;
      _$alunosAtom.reportChanged();
    }, _$alunosAtom, name: '${_$alunosAtom.name}_set');
  }

  final _$_AlunoControllerActionController =
      ActionController(name: '_AlunoController');

  @override
  dynamic getAlunos(String campo, dynamic valor) {
    final _$actionInfo = _$_AlunoControllerActionController.startAction();
    try {
      return super.getAlunos(campo, valor);
    } finally {
      _$_AlunoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getWithWhere(String campo, dynamic valor) {
    final _$actionInfo = _$_AlunoControllerActionController.startAction();
    try {
      return super.getWithWhere(campo, valor);
    } finally {
      _$_AlunoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(AlunoModel aluno) {
    final _$actionInfo = _$_AlunoControllerActionController.startAction();
    try {
      return super.save(aluno);
    } finally {
      _$_AlunoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'alunos: ${alunos.toString()}';
    return '{$string}';
  }
}
