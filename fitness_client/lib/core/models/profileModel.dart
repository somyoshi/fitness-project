class Profile {
  String id;
  String nome;
  String email;
  String img;

  Profile({this.id='', this.nome='', this.email='', this.img=''});

  Profile.map(dynamic obj, {String documentID}) {
    id = documentID;
    nome = obj['nome'];
    email = obj['email'];
    img = obj['img'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["nome"] = (this.nome ?? '').toUpperCase();
    map["email"] = (this.email ?? '').toUpperCase();
    map["img"] = (this.img ?? '').toUpperCase();
    return map;
  }
}
