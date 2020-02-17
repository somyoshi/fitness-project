class AvisoModel {
  String id;
  String titulo;
  String mensagem;
  AvisoModel({this.id, this.titulo, this.mensagem}) {
    this.id ??= '';
    this.titulo ??= '';
    this.mensagem ??= '';
  }

  AvisoModel.map(dynamic obj, {String documentID}) {
    this.id = documentID;
    this.titulo = obj['titulo'];
    this.mensagem = obj['mensagem'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["titulo"] = (this.titulo ?? '').toUpperCase();
    map["mensagem"] = (this.mensagem ?? '').toUpperCase();
    return map;
  }
}
