import 'package:fitness_client/core/models/exercicioModel.dart';

class ExecucaoModel {
  ExercicioModel exercicio;
  double repeticoes;
  double peso;
  double distancia;
  double tempo;
  double intervalo;

  ExecucaoModel(
      {this.exercicio,
      this.repeticoes,
      this.peso,
      this.distancia,
      this.tempo,
      this.intervalo}) {
    this.exercicio ??= ExercicioModel();
    this.repeticoes ??= 0.0;
    this.peso ??= 0.0;
    this.distancia ??= 0.0;
    this.tempo ??= 0.0;
    this.intervalo ??= 0.0;
  }

  ExecucaoModel.map(dynamic obj) {
    this.exercicio = ExercicioModel.map(obj['exercicio']);
    this.repeticoes = double.parse(obj["repeticoes"].toString());
    this.peso = double.parse(obj["peso"].toString());
    this.distancia = double.parse(obj["distancia"].toString());
    this.tempo = double.parse(obj["tempo"].toString());
    this.intervalo = double.parse(obj["intervalo"].toString());
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["exercicio"] = this.exercicio.toMap();
    map["repeticoes"] = (this.repeticoes ?? 0.0);
    map["peso"] = (this.peso ?? 0.0);
    map["distancia"] = (this.distancia ?? 0.0);
    map["tempo"] = (this.tempo ?? 0.0);
    map["intervalo"] = (this.intervalo ?? 0.0);
    return map;
  }
}
