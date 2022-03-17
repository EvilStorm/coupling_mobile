import 'dart:convert';

class NotifyModel {
  int id;
  int seq;
  String title;
  String message;
  int appStop;
  int important;
  DateTime createdAt;
  NotifyModel({
    required this.id,
    required this.seq,
    required this.title,
    required this.message,
    required this.appStop,
    required this.important,
    required this.createdAt,
  });

  NotifyModel copyWith({
    int? id,
    int? seq,
    String? title,
    String? message,
    int? appStop,
    int? important,
    DateTime? createdAt,
  }) {
    return NotifyModel(
      id: id ?? this.id,
      seq: seq ?? this.seq,
      title: title ?? this.title,
      message: message ?? this.message,
      appStop: appStop ?? this.appStop,
      important: important ?? this.important,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'seq': seq,
      'title': title,
      'message': message,
      'appStop': appStop,
      'important': important,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory NotifyModel.fromMap(Map<String, dynamic> map) {
    return NotifyModel(
      id: map['id']?.toInt() ?? 0,
      seq: map['seq']?.toInt() ?? 0,
      title: map['title'] ?? '',
      message: map['message'] ?? '',
      appStop: map['appStop']?.toInt() ?? 0,
      important: map['important']?.toInt() ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotifyModel.fromJson(String source) =>
      NotifyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotifyModel(id: $id, seq: $seq, title: $title, message: $message, appStop: $appStop, important: $important, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotifyModel &&
        other.id == id &&
        other.seq == seq &&
        other.title == title &&
        other.message == message &&
        other.appStop == appStop &&
        other.important == important &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        seq.hashCode ^
        title.hashCode ^
        message.hashCode ^
        appStop.hashCode ^
        important.hashCode ^
        createdAt.hashCode;
  }
}
