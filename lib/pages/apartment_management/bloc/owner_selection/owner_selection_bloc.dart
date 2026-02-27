import 'package:bloc/bloc.dart';
import 'package:proconnect/domain/admin/usecase/get_users_use_case.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/pages/apartment_management/bloc/owner_selection/owner_selection_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/owner_selection/owner_selection_state.dart';

class OwnerSelectionBloc
    extends Bloc<OwnerSelectionEvent, OwnerSelectionState> {
  OwnerSelectionBloc({
    required GetUsersUseCase getUsersUseCase,
  }) : _getUsersUseCase = getUsersUseCase,
       super(const OwnerSelectionState.initial()) {
    on<OwnerSelectionEvent>((event, emit) async {
      await event.when(
        fetchOwners: () => _onFetchOwners(emit),
      );
    });
  }

  final GetUsersUseCase _getUsersUseCase;

  Future<void> _onFetchOwners(Emitter<OwnerSelectionState> emit) async {
    emit(const OwnerSelectionState.loading());
    try {
      final allUsers = await _getUsersUseCase();
      final owners = allUsers
          .where((user) => user.role == UserRole.owner)
          .toList();
      emit(OwnerSelectionState.success(owners: owners));
    } catch (_) {
      emit(const OwnerSelectionState.failure(errorKey: 'loadOwnersFailed'));
    }
  }
}
