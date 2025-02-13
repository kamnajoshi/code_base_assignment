import 'package:codebase_assignment/features/dashboard/domain/entities/user_data_entity.dart';



abstract class UserRepository {
  Future<(List<UserDataEntity>, bool)> getUsers(int page, int perPage);
}