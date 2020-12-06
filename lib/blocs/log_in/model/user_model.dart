class User {
  int id;
  int userId;
  String username;
  String token;

  User(
      {this.id,
      this.userId,
      this.username,
      this.token});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
      id: data['id'],
      userId: data['user_id'],
      username: data['username'],
      token: data['token'],
  );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "user_id":this.userId,
        "username": this.username,
        "token": this.token
      };
}
