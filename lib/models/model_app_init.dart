import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'model_agree_term.dart';
import 'model_app_update.dart';
import 'model_notify.dart';

class AppInitModel {
  var processState = [true, true, true];

  void setProcessStateChanged(int index, bool isPassed) {
    processState[index] = isPassed;
  }

  AppUpdateModel? appVer;
  List<NotifyModel>? notify;
  AgreementModel? term;
  AppInitModel({
    this.appVer,
    this.notify,
    this.term,
  });

  AppInitModel copyWith({
    AppUpdateModel? appVer,
    List<NotifyModel>? notify,
    AgreementModel? term,
  }) {
    return AppInitModel(
      appVer: appVer ?? this.appVer,
      notify: notify ?? this.notify,
      term: term ?? this.term,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appVer': appVer?.toMap(),
      'notify': notify?.map((x) => x.toMap()).toList(),
      'term': term?.toMap(),
    };
  }

  factory AppInitModel.fromMap(Map<String, dynamic> map) {
    return AppInitModel(
      appVer: (map.containsKey('appVer') && map['appVer'] != null)
          ? AppUpdateModel.fromMap(map['appVer'])
          : null,
      notify: (map.containsKey('notify') && map['notify'] != null)
          ? List<NotifyModel>.from(
              map['notify']?.map((x) => NotifyModel.fromMap(x)))
          : null,
      term: (map.containsKey('term') && map['term'] != null)
          ? AgreementModel.fromMap(map['term'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppInitModel.fromJson(String source) =>
      AppInitModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppInitModel(appVer: $appVer, notify: $notify, term: $term)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppInitModel &&
        other.appVer == appVer &&
        listEquals(other.notify, notify) &&
        other.term == term;
  }

  @override
  int get hashCode => appVer.hashCode ^ notify.hashCode ^ term.hashCode;
}
