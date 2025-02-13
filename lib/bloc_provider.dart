import 'package:codebase_assignment/core/dependency_injection.dart';
import 'package:codebase_assignment/features/dashboard/presentation/blocs/user_detail_bloc/user_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider {
  const AppBlocProvider._();

  static final _userFetchedDetails = BlocProvider<UserBloc>(
    create: (BuildContext context) => UserBloc(sl()),
  );

  static List<BlocProvider> get appBlocs => [
    _userFetchedDetails,
  ];
}
