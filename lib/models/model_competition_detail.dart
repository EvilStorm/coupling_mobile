class CompetitionDetailModel {
  int? id;
  int? opponentId;
  String? title;
  LocationLatLng? locationLatLng;
  String? location;
  String? locationName;
  DateTime? matchTime;
  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  User? user;
  List<Challengers>? challengers;
  User? oppoent;

  CompetitionDetailModel(
      {this.id,
      this.opponentId,
      this.title,
      this.locationLatLng,
      this.location,
      this.locationName,
      this.matchTime,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.user,
      this.challengers,
      this.oppoent});

  CompetitionDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    opponentId = json['opponentId'];
    title = json['title'];
    locationLatLng = json['locationLatLng'] != null
        ? new LocationLatLng.fromJson(json['locationLatLng'])
        : null;
    location = json['location'];
    locationName = json['locationName'];
    matchTime = DateTime.parse(json['matchTime']);
    message = json['message'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    userId = json['UserId'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    if (json['Challengers'] != null) {
      challengers = <Challengers>[];
      json['Challengers'].forEach((v) {
        challengers!.add(new Challengers.fromJson(v));
      });
    }
    oppoent =
        json['Oppoent'] != null ? new User.fromJson(json['Oppoent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['opponentId'] = this.opponentId;
    data['title'] = this.title;
    if (this.locationLatLng != null) {
      data['locationLatLng'] = this.locationLatLng!.toJson();
    }
    data['location'] = this.location;
    data['locationName'] = this.locationName;
    data['matchTime'] = this.matchTime;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['UserId'] = this.userId;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    if (this.challengers != null) {
      data['Challengers'] = this.challengers!.map((v) => v.toJson()).toList();
    }
    if (this.oppoent != null) {
      data['Oppoent'] = this.oppoent!.toJson();
    }
    return data;
  }
}

class LocationLatLng {
  String? type;
  List<double>? coordinates;

  LocationLatLng({this.type, this.coordinates});

  LocationLatLng.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Challengers {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? competitionId;
  int? userId;
  User? user;

  Challengers(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.competitionId,
      this.userId,
      this.user});

  Challengers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    competitionId = json['CompetitionId'];
    userId = json['UserId'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['CompetitionId'] = this.competitionId;
    data['UserId'] = this.userId;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? nickName;
  String? photoUrl;
  int? age;
  int? gender;
  int? height;
  int? weight;
  String? kakaoTalkId;
  LocationLatLng? locationLatLng;
  String? location;
  String? history;
  String? firebaseToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? accountId;

  User(
      {this.id,
      this.nickName,
      this.photoUrl,
      this.age,
      this.gender,
      this.height,
      this.weight,
      this.kakaoTalkId,
      this.locationLatLng,
      this.location,
      this.history,
      this.firebaseToken,
      this.createdAt,
      this.updatedAt,
      this.accountId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickName = json['nickName'];
    photoUrl = json['photoUrl'];
    age = json['age'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    kakaoTalkId = json['kakaoTalkId'];
    locationLatLng = json['locationLatLng'];
    location = json['location'];
    history = json['history'];
    firebaseToken = json['firebaseToken'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    accountId = json['AccountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickName'] = this.nickName;
    data['photoUrl'] = this.photoUrl;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['kakaoTalkId'] = this.kakaoTalkId;
    data['locationLatLng'] = this.locationLatLng;
    data['location'] = this.location;
    data['history'] = this.history;
    data['firebaseToken'] = this.firebaseToken;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['AccountId'] = this.accountId;
    return data;
  }
}
