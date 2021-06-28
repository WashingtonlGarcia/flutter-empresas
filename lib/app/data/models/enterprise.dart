import 'package:flutter/material.dart' show Color;

import '../../utils/utils.dart' show ColorGenerator;
import 'deserializable.dart';

class EnterpriseKey extends DeserializableKey {
  String enterpriseName;
  String photo;
  String description;

  EnterpriseKey()
      : enterpriseName = 'enterprise_name',
        photo = 'photo',
        description = 'description',
        super(id: 'id');
}

class Enterprise extends Deserializable {
  final String enterpriseName;
  final String photo;
  final String description;
  final Color color;

  Enterprise(
      {required int id,
      required this.enterpriseName,
      required this.photo,
      required this.description,
      required this.color})
      : super(id: id);

  factory Enterprise.fromMap({required Map<String, Object?> map}) {
    final EnterpriseKey key = EnterpriseKey();
    return Enterprise(
        id: map[key.id]! as int,
        enterpriseName: map[key.enterpriseName]! as String,
        photo: map[key.photo]! as String,
        description: map[key.description]! as String,
        color: ColorGenerator.random);
  }

  @override
  Map<String, Object> toMap() {
    final EnterpriseKey key = EnterpriseKey();
    return {
      key.id: id,
      key.description: description,
      key.photo: photo,
      key.enterpriseName: enterpriseName
    };
  }
}
