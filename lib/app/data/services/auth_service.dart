import 'package:dio/dio.dart' show Response;
import '../http/http.dart' show HttpClientAuthetication;

import 'service.dart';

class AuthService extends Service {
  AuthService() : super(route: 'users/auth/sign_in');

  @override
  Future<HttpClientAuthetication> post(
      {Map<String, Object>? query, Map<String, Object?>? map}) async {
    final Response response =
        await super.post(query: query, map: map) as Response;
    return HttpClientAuthetication.fromHeader(headers: response.headers);
  }
}
