import '../models/enterprise.dart';
import '../services/services.dart' show EnterpriseService;

class EnterpriseRepository {
  final EnterpriseService _service;

  EnterpriseRepository({required EnterpriseService service})
      : _service = service;

  Future<List<Enterprise>?> getAll() {
    return _service.get();
  }
}
