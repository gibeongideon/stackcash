class UserRegister {
  String username;
  String email;
  String password;

  UserRegister({this.username,this.email, this.password});

  factory UserRegister.fromJson(Map<String,dynamic>json){
    return UserRegister(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      
    );
}
}



