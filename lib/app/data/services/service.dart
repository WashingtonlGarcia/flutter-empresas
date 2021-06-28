import '../http/http.dart';

abstract class Service extends HttpClient {
  Service({required String route, HttpClientAuthetication? httpAuthetication})
      : super(
          endPoint: 'https://empresas.ioasys.com.br/api/v1/',
          route: route,
          headers: httpAuthetication?.toMap(),
        );
}
