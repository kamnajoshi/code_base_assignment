import 'package:codebase_assignment/core/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:codebase_assignment/features/dashboard/data/models/user_data_model.dart';



// class UserRemoteDataSourceImpl {
//   final Dio dio;
//   final String baseUrl = 'https://reqres.in/api';

//   UserRemoteDataSourceImpl({required this.dio});

//   Future<List<UserModel>> getUsers() async {
//     try {
//       final response = await dio.get('$baseUrl/users');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = response.data;
//         final List<dynamic> usersData = jsonData['data'];
//         return usersData
//             .map((userData) => UserModel.fromJson(userData))
//             .toList();
//       } else {
//         throw Exception("Error fetching users");
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }


class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  Future<(List<UserModel>, bool)> getUsers(int page, int perPage) async {
    try {
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.users}',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );

      final List<UserModel> users = (response.data['data'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList();

      final totalPages = response.data['total_pages'] as int;
      final hasMoreData = page < totalPages;

      return (users, hasMoreData);
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }
}