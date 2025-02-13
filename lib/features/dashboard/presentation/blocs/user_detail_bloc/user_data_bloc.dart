import 'package:codebase_assignment/features/dashboard/domain/entities/user_data_entity.dart';
import 'package:codebase_assignment/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_data_event.dart';
part 'user_data_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  
  UserBloc(this.getUsersUseCase) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<LoadMoreUsers>(_onLoadMoreUsers);
  }

  Future<void> _onFetchUsers(
    FetchUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final (users, hasMore) = await getUsersUseCase.execute(1, 12);
      emit(UserLoaded(users: users, page: 1, hasMoreData: hasMore));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  Future<void> _onLoadMoreUsers(
    LoadMoreUsers event,
    Emitter<UserState> emit,
  ) async {
    final currentState = state;
    if (currentState is UserLoaded) {
      try {
        final nextPage = currentState.page + 1;
        final (newUsers, hasMore) = await getUsersUseCase.execute(nextPage, 10);
        emit(
          UserLoaded(
            users: [...currentState.users, ...newUsers],
            page: nextPage,
            hasMoreData: hasMore,
          ),
        );
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    }
  }
}
