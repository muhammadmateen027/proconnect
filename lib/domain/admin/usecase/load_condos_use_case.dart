import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/models/condo.dart';

class LoadCondosUseCase {
  LoadCondosUseCase(this._repository);
  final CondoRepository _repository;

  Future<List<Condo>> call({String? agencyId}) {
    return _repository.getCondos(agencyId: agencyId);
  }
}
