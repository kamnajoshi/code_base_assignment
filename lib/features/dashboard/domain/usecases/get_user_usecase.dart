import 'package:codebase_assignment/features/dashboard/domain/entities/user_data_entity.dart';
import 'package:codebase_assignment/features/dashboard/domain/repositories/user_data_repository.dart';


class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<(List<UserDataEntity>, bool)> execute(int page, int perPage) {
    return repository.getUsers(page, perPage);
  }
}


