

import 'package:codebase_assignment/features/dashboard/data/remote_source_data/user_remote_data.dart';
import 'package:codebase_assignment/features/dashboard/domain/entities/user_data_entity.dart';

import '../../domain/repositories/user_data_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<(List<UserDataEntity>, bool)> getUsers(int page, int perPage) {
    return dataSource.getUsers(page, perPage);
  }
}

