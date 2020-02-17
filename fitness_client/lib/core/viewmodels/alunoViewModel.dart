import 'package:fitness_client/core/models/alunoModel.dart';
import 'package:fitness_client/core/providers/alunoProvider.dart';
import 'package:flutter/material.dart';

class AlunoViewModel extends ChangeNotifier{
  AlunoModel aluno = AlunoModel();
  bool isAluno = false;

  Stream<AlunoModel> getAlunoByCPF(String alunoCPF) {
    return AlunoProvider().getAlunoByCPF(alunoCPF);
  }

  void deleteAluno(AlunoModel aluno) {
    return AlunoProvider().delete(aluno);
  }

  void createAluno(AlunoModel aluno) {
    return AlunoProvider().create(aluno);
  }

  void updateAluno(AlunoModel aluno) {
    return AlunoProvider().update(aluno);
  }
}
