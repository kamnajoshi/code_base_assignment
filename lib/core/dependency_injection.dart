import 'package:codebase_assignment/features/dashboard/data/remote_source_data/user_remote_data.dart';
import 'package:codebase_assignment/features/dashboard/data/repository_implementation/user_data_repo_impl.dart';
import 'package:codebase_assignment/features/dashboard/domain/repositories/user_data_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:codebase_assignment/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:codebase_assignment/features/dashboard/presentation/blocs/user_detail_bloc/user_data_bloc.dart';

GetIt sl = GetIt.instance;

void serviceLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(sl()));

  sl.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(sl()));

  sl.registerLazySingleton<GetUsersUseCase>(
      () => GetUsersUseCase(sl<UserRepository>()));

  sl.registerFactory<UserBloc>(() => UserBloc(sl<GetUsersUseCase>()));
}
