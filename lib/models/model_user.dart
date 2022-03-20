class UserModel {
  int? id;
  String? nickName;
  String? photoUrl;
  int? age;
  String? firebaseToken;
  int? gender;
  int? height;
  int? weight;
  dynamic locationLatLng;
  String? location;
  String? history;
  String? identifyId;
  String? email;
  String? kakaoTalkId;
  int? secureLevel;
  int? joinType;

  UserModel(
      {this.id,
      this.nickName,
      this.photoUrl,
      this.age,
      this.firebaseToken,
      this.gender,
      this.height,
      this.weight,
      this.locationLatLng,
      this.location,
      this.history,
      this.identifyId,
      this.email,
      this.kakaoTalkId,
      this.secureLevel,
      this.joinType});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickName = json['nickName'];
    photoUrl = json['photoUrl'];
    age = json['age'];
    firebaseToken = json['firebaseToken'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    locationLatLng = json['locationLatLng'];
    location = json['location'];
    history = json['history'];
    identifyId = json['identifyId'];
    email = json['email'];
    kakaoTalkId = json['kakaoTalkId'];
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
    data['gender'] = gender;
    data['height'] = height;
    data['weight'] = weight;
    data['locationLatLng'] = locationLatLng;
    data['location'] = location;
    data['history'] = history;
    data['identifyId'] = identifyId;
    data['email'] = email;
    data['kakaoTalkId'] = kakaoTalkId;
    data['secureLevel'] = secureLevel;
    data['joinType'] = joinType;
    return data;
  }
}
