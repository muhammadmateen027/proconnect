import 'package:proconnect/domain/condo/repository/condo_repository.dart';

class DeleteCondoUseCase {
  DeleteCondoUseCase(this._repository);
  final CondoRepository _repository;

  Future<void> call({required String id}) {
    return _repository.deleteCondo(id: id);
  }
}
