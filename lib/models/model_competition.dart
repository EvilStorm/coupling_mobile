import 'model_user.dart';

class CompetitionModel {
  int? id;
  int? opponentId;
  String? title;
  dynamic locationLatLng;
  String? location;
  String? locationName;
  DateTime? matchTime;
  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  UserModel? user;

  CompetitionModel(
      {id,
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
      this.user});

  CompetitionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    opponentId = json['opponentId'];
    title = json['title'];
    locationLatLng = json['locationLatLng'];
    location = json['location'];
    locationName = json['locationName'];
    matchTime = DateTime.parse(json['matchTime']);
    message = json['message'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    userId = json['UserId'];
    user = json['User'] != null ? UserModel.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['opponentId'] = opponentId;
    data['title'] = title;
    data['locationLatLng'] = locationLatLng;
    data['location'] = location;
    data['locationName'] = locationName;
    data['matchTime'] = matchTime;
    data['message'] = message;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['UserId'] = userId;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}
