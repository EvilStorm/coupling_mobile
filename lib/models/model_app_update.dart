import 'dart:convert';

class AppUpdateModel {
  int id;
  int seq;
  String message;
  int nessesary;
  int version;
  AppUpdateModel({
    required this.id,
    required this.seq,
    required this.message,
    required this.nessesary,
    required this.version,
  });

  AppUpdateModel copyWith({
    int? id,
    int? seq,
    String? message,
    int? nessesary,
    int? version,
  }) {
    return AppUpdateModel(
      id: id ?? this.id,
      seq: seq ?? this.seq,
      message: message ?? this.message,
      nessesary: nessesary ?? this.nessesary,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'seq': seq,
      'message': message,
      'nessesary': nessesary,
      'version': version,
    };
  }

  factory AppUpdateModel.fromMap(Map<String, dynamic> map) {
    return AppUpdateModel(
      id: map['id']?.toInt() ?? 0,
      seq: map['seq']?.toInt() ?? 0,
      message: map['message'] ?? '',
      nessesary: map['nessesary']?.toInt() ?? 0,
      version: map['version']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUpdateModel.fromJson(String source) =>
      AppUpdateModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppUpdateModel(id: $id, seq: $seq, message: $message, nessesary: $nessesary, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUpdateModel &&
        other.id == id &&
        other.seq == seq &&
        other.message == message &&
        other.nessesary == nessesary &&
        other.version == version;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      seq.hashCode ^
      message.hashCode ^
      nessesary.hashCode ^
      version.hashCode;
}
