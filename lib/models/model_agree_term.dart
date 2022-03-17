import 'dart:convert';

class AgreementModel {
  int id;
  int seq;
  String term;
  String userTerm;
  AgreementModel({
    required this.id,
    required this.seq,
    required this.term,
    required this.userTerm,
  });

  AgreementModel copyWith({
    int? id,
    int? seq,
    String? term,
    String? userTerm,
  }) {
    return AgreementModel(
      id: id ?? this.id,
      seq: seq ?? this.seq,
      term: term ?? this.term,
      userTerm: userTerm ?? this.userTerm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'seq': seq,
      'term': term,
      'userTerm': userTerm,
    };
  }

  factory AgreementModel.fromMap(Map<String, dynamic> map) {
    return AgreementModel(
      id: map['id']?.toInt() ?? 0,
      seq: map['seq']?.toInt() ?? 0,
      term: map['term'] ?? '',
      userTerm: map['userTerm'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AgreementModel.fromJson(String source) =>
      AgreementModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AgreementModel(id: $id, seq: $seq, term: $term, userTerm: $userTerm)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AgreementModel &&
        other.id == id &&
        other.seq == seq &&
        other.term == term &&
        other.userTerm == userTerm;
  }

  @override
  int get hashCode =>
      id.hashCode ^ seq.hashCode ^ term.hashCode ^ userTerm.hashCode;
}
