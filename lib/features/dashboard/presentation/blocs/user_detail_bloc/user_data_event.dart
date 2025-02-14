part of 'user_data_bloc.dart';

abstract class UserEvent {}

class FetchUsers extends UserEvent {}

class LoadMoreUsers extends UserEvent {}