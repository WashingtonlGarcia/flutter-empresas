import '../http/http.dart' show HttpClientAuthetication;
import '../services/services.dart' show AuthService;

class UserAuthKey {
  final String email;
  final String password;

  UserAuthKey()
      : email = 'email',
        password = 'password';
}

class UserAuth {
  String? email;
  String? password;

  UserAuth({this.email, this.password});

  Map<String, Object> toMap() {
    final UserAuthKey key = UserAuthKey();
    return {key.email: email!, key.password: password!};
  }
}

class AuthRepository {
  final AuthService _service;

  AuthRepository({required AuthService service}) : _service = service;

  Future<HttpClientAuthetication> signIn({required UserAuth userAuth}) async {
    return _service.post(map: userAuth.toMap());
  }
}
