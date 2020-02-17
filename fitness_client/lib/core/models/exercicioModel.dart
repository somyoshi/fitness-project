class ExercicioModel {
  String id;
  String descricao;
  List<String> imagens = [];
  String video;

  ExercicioModel({this.id, this.descricao, this.imagens, this.video}) {
    this.id ??= '';
    this.descricao ??= '';
    this.imagens ??= [];
    this.video ??= '';
  }

  ExercicioModel.map(dynamic obj, {String documentID}) {
    this.id = documentID;
    this.descricao = obj['descricao'];
    for (String imagem in obj['imagens']) {
      this.imagens.add(imagem);
    }
    this.video = obj['video'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["descricao"] = (this.descricao ?? '').toUpperCase();
    map["video"] = (this.video ?? '').toUpperCase();
    List<String> imagens = [];
    for (String imagem in this.imagens) {
      imagens.add(imagem);
    }
    map["imagens"] = imagens;
    return map;
  }
}



