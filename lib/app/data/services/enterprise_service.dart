import 'package:dio/dio.dart' show Response;
import '../http/http.dart' show HttpClientAuthetication;
import '../models/enterprise.dart';
import 'service.dart';

class EnterpriseService extends Service {
  EnterpriseService({required HttpClientAuthetication httpAuthetication})
      : super(route: 'enterprises', httpAuthetication: httpAuthetication);

  @override
  Future<List<Enterprise>?> get({Map<String, Object>? query}) async {
    final response = (await super.get(query: query) as Response).data;
    if (response['enterprises'] is List) {
      return (response['enterprises'] as List)
          .cast<Map<String, Object?>>()
          .map((Map<String, Object?> map) => Enterprise.fromMap(map: map))
          .toList();
    }
    throw 'Nenhuma empresa encontrada!';
  }
}
