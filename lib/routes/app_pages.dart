import 'package:codebase_assignment/features/dashboard/presentation/views/users_list_view.dart';
import 'package:codebase_assignment/features/dashboard/presentation/views/user_detail_screen.dart';
import 'package:codebase_assignment/routes/app_route.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.userList,
      builder: (context, state) =>  UsersPage(),
    ),
    GoRoute(
      path: AppRoutes.userInfo,  
      builder: (context, state) {
        final userId = int.parse(state.pathParameters['userId'] ?? '0');
        return UserDetailPage(userId: userId);
      },
    ),
  ],
);