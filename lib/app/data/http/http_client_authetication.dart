import 'package:dio/dio.dart';

class HttpClientAutheticationKey {
  final String accessToken;
  final String client;
  final String uid;

  HttpClientAutheticationKey()
      : accessToken = 'access-token',
        client = 'client',
        uid = 'uid';
}

class HttpClientAuthetication {
  final String accessToken;
  final String client;
  final String uid;

  const HttpClientAuthetication({required this.accessToken, required this.client, required this.uid});

  factory HttpClientAuthetication.fromHeader({required Headers headers}) {
    final HttpClientAutheticationKey key = HttpClientAutheticationKey();
    return HttpClientAuthetication(
      accessToken: headers.value(key.accessToken)!,
      client: headers.value(key.client)!,
      uid: headers.value(key.uid)!,
    );
  }

  Map<String, Object> toMap() {
    final HttpClientAutheticationKey key = HttpClientAutheticationKey();
    return {key.client: client, key.uid: uid, key.accessToken: accessToken};
  }
}
