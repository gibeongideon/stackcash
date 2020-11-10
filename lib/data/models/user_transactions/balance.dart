class Balance {
  int userId;
  int id;
  String title;
  String body;

  Balance({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Balance.fromMap(Map<String, dynamic> json) => Balance(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
  
}
