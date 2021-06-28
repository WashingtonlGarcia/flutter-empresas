import 'enterprise.dart';

abstract class DeserializableKey {
  final String id;

  DeserializableKey({required this.id});
}

abstract class Deserializable {
  final int id;

  Deserializable({required this.id});

  Map<String, Object> toMap();
}

D deserializer<D extends Deserializable>({required Map<String, Object?> map}) {
  switch (D) {
    case Enterprise:
      return Enterprise.fromMap(map: map) as D;
    default:
      throw 'There is no such type!';
  }
}
