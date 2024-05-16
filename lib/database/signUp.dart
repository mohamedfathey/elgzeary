class SignUp {
  int? id;
  String? username;
  String? password;
  SignUp({this.id, this.username, this.password});

  SignUp.fromJson(Map map) {
    id = map['id'];
    username = map['username'];
    password = map['password'];
  }
}
