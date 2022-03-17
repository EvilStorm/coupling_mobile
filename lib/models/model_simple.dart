import 'dart:convert';

class ModelSimple {
  int result = 0;
  String message = "";
  ModelSimple({
    required this.result,
    required this.message,
  });

  ModelSimple copyWith({
    int? result,
    String? message,
  }) {
    return ModelSimple(
      result: result ?? this.result,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'result': result,
      'message': message,
    };
  }

  factory ModelSimple.fromMap(Map<String, dynamic> map) {
    return ModelSimple(
      result: map['result']?.toInt() ?? 0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelSimple.fromJson(String source) =>
      ModelSimple.fromMap(json.decode(source));

  @override
  String toString() => 'ModelSimple(result: $result, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelSimple &&
        other.result == result &&
        other.message == message;
  }

  @override
  int get hashCode => result.hashCode ^ message.hashCode;
}
