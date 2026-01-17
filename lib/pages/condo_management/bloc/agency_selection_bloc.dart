import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/admin/usecase/get_users_use_case.dart';
import 'package:proconnect/domain/models/app_user.dart';

part 'agency_selection_event.dart';
part 'agency_selection_state.dart';
part 'agency_selection_bloc.freezed.dart';

class AgencySelectionBloc
    extends Bloc<AgencySelectionEvent, AgencySelectionState> {
  AgencySelectionBloc({
    required GetUsersUseCase getUsersUseCase,
  }) : _getUsersUseCase = getUsersUseCase,
       super(const AgencySelectionState.initial()) {
    on<_FetchAgencyAdmins>(_onFetchAgencyAdmins);
  }

  final GetUsersUseCase _getUsersUseCase;

  Future<void> _onFetchAgencyAdmins(
    _FetchAgencyAdmins event,
    Emitter<AgencySelectionState> emit,
  ) async {
    emit(const AgencySelectionState.loading());
    try {
      final allUsers = await _getUsersUseCase();
      final agencyAdmins = allUsers
          .where((user) => user.role == UserRole.agency_admin)
          .toList();
      emit(AgencySelectionState.success(agencyAdmins: agencyAdmins));
    } catch (_) {
      emit(const AgencySelectionState.failure(errorKey: 'loadAgenciesFailed'));
    }
  }
}
