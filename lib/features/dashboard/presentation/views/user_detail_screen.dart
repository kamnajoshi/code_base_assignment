import 'package:codebase_assignment/features/dashboard/presentation/blocs/user_detail_bloc/user_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:codebase_assignment/constants/app_strings.dart';
import 'package:codebase_assignment/utils/themes/app_color_theme.dart';
import 'package:codebase_assignment/utils/themes/text_theme.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          AppStrings.useDetails,
          style: AppTextTheme.lightTextTheme.bodyLarge,
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserError) {
            return Center(child: Text(state.message));
          }
          if (state is UserLoaded) {
            final user = state.users.firstWhere((user) => user.id == userId, );

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: AppTextTheme.lightTextTheme.bodyLarge,
                    ),
                    SizedBox(height: 8),
                    Text(
                      user.email,
                      style: AppTextTheme.lightTextTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
