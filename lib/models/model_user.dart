class UserModel {
  int? id;
  String? nickName;
  String? photoUrl;
  int? age;
  String? firebaseToken;
  String? identifyId;
  String? email;
  int? secureLevel;
  int? joinType;

  UserModel(
      {this.id,
      this.nickName,
      this.photoUrl,
      this.age,
      this.firebaseToken,
      this.identifyId,
      this.email,
      this.secureLevel,
      this.joinType});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickName = json['nickName'];
    photoUrl = json['photoUrl'];
    age = json['age'];
    firebaseToken = json['firebaseToken'];
    identifyId = json['identifyId'];
    email = json['email'];
    secureLevel = json['secureLevel'];
    joinType = json['joinType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickName'] = nickName;
    data['photoUrl'] = photoUrl;
    data['age'] = age;
    data['firebaseToken'] = firebaseToken;
    data['identifyId'] = identifyId;
    data['email'] = email;
    data['secureLevel'] = secureLevel;
    data['joinType'] = joinType;
    return data;
  }
}
