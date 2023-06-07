class User {
  String? name;
  String? email;
  String? id;
  String? telefone;
  String? senha;

  User({this.id, this.email, this.name, this.telefone, this.senha});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'telefone': telefone,
      'senha': senha
    };
  }

  factory User.fromMap(map) {
    return User(
        name: map['name'],
        email: map['email'],
        id: map['uid'],
        telefone: map['telefone'],
        senha: map['senha']);
  }
}
