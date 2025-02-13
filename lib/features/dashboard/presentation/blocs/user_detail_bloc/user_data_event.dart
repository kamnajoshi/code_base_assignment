part of 'user_data_bloc.dart';

// @immutable
// abstract class UserDataEvent {}
// class FetchUserData extends UserDataEvent {}

abstract class UserEvent {}

class FetchUsers extends UserEvent {}

class LoadMoreUsers extends UserEvent {}