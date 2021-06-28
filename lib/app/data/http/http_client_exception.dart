import 'package:dio/dio.dart';

class HttpClientException implements Exception {
  final DioError _dioError;

  HttpClientException({required DioError error}) : _dioError = error;

  String _onError() {
    switch (_dioError.type) {
      case DioErrorType.cancel:
        return 'A solicitação foi cancelada!';
      case DioErrorType.connectTimeout:
        return 'O tempo limite da url está aberto!';
      case DioErrorType.receiveTimeout:
        return 'Atingiu tempo limite!';
      case DioErrorType.response:
        switch (_dioError.response!.statusCode) {
          case 400:
            return 'O servidor não pode ou não processará a solicitação devido a algo que é percebido como um erro do cliente!';
          case 401:
            return 'A solicitação não foi aplicada porque não possui credenciais de autenticação válidas para o recurso de destino!';
          case 403:
            return 'O servidor entendeu a solicitação, mas se recusa a autorizá-la!';
          case 404:
            return 'O servidor não conseguiu encontrar o que foi solicitado ou foi configurado para não atender à solicitação e não revelar o motivo!';
          case 408:
            return 'O tempo limite do envio da url foi atingido!';
          case 409:
            return 'A solicitação não pôde ser concluída devido a um conflito com o estado atual do recurso de destino!';
          case 500:
            return 'Um erro inesperado aconteceu!';
          case 503:
            return 'O servidor não pode atender à solicitação devido a uma sobrecarga temporária ou manutenção do servidor!';
          default:
            return 'O servidor respondeu, mas com um status incorreto!';
        }
      case DioErrorType.sendTimeout:
        return 'O tempo limite do envio da url foi atingido!';
      case DioErrorType.other:
      default:
        return 'Um erro inesperado aconteceu!';
    }
  }

  @override
  String toString() {
    return _onError();
  }
}
