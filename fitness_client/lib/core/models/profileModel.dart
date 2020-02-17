class ProfileModel{
  String id;
  String nome;
  String email;
  String imagem;
  String cpf;

  ProfileModel({this.id, this.nome, this.email, this.imagem, this.cpf}){
    this.id ??= '';
    this.nome ??= '';
    this.email ??= '';
    this.imagem ??= '';
    this.cpf ??= '';
  }

  ProfileModel.map(dynamic obj, {String documentID}) {
    this.id = documentID;
    this.nome = obj['nome'];
    this.email = obj['email'];
    this.imagem = obj['imagem'];
    this.cpf = obj['cpf'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["nome"] = (this.nome ?? '').toUpperCase();
    map["email"] = (this.email ?? '').toUpperCase();
    map["imagem"] = (this.imagem ?? '').toUpperCase();
    map["cpf"] = (this.cpf ?? '').toUpperCase();
    return map;
  }
}
