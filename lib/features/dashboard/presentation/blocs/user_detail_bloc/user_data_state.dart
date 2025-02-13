part of 'user_data_bloc.dart';

// @immutable
// sealed class UserDataState {}

// final class UserDataInitial extends UserDataState {}

// final class UserDataLoading extends UserDataState {}

// final class UserDataLoaded extends UserDataState {
//   final List<UserDataEntity> users;
//   UserDataLoaded(this.users);
// }

// final class UserDataError extends UserDataState {
//   final String message;
//   UserDataError(this.message);
// }

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserDataEntity> users;
  final int page;
  final bool hasMoreData;

  UserLoaded({
    required this.users,
    required this.page,
    required this.hasMoreData,
  });
}
class UserError extends UserState {
  final String message;

  UserError({required this.message});
}
