import 'dart:async';
import 'package:codebase_assignment/features/dashboard/domain/entities/user_data_entity.dart';
import 'package:codebase_assignment/utils/themes/common_widgets/custom_button_widget.dart';
import 'package:codebase_assignment/utils/themes/common_widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:codebase_assignment/constants/app_strings.dart';
import 'package:codebase_assignment/features/dashboard/presentation/blocs/user_detail_bloc/user_data_bloc.dart';
import 'package:codebase_assignment/utils/themes/app_color_theme.dart';
import 'package:codebase_assignment/utils/themes/text_theme.dart';

import 'user_detail_screen.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  List<UserDataEntity> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          AppStrings.usersList,
          style: AppTextTheme.lightTextTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(12.0),
            child: 
            CustomTextFeild(controller: searchController, hintText: "Search users...", prefixIcon: Icons.search,)
            
            
          
          ),
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserInitial) {
                  return Center(
                    child: CustomButton(backgroundColor: AppColors.primary,  text: "Get all users", onPressed: (){context.read<UserBloc>().add(FetchUsers());})
                  );
                }

                if (state is UserLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is UserError) {
                  return Center(child: Text(state.message));
                }

                if (state is UserLoaded) {
          
                  _filteredUsers = state.users.where((user) {
                    final query = searchController.text.toLowerCase().trim();
                    final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
                    return fullName.contains(query.replaceAll(RegExp(r'[^a-zA-Z0-9]'), ''));
                  }).toList();

                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<UserBloc>().add(FetchUsers());
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = _filteredUsers[index];
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(user.avatar),
                            ),
                            title: Text(
                              '${user.firstName} ${user.lastName}',
                              style: AppTextTheme.lightTextTheme.bodyMedium,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailPage(userId: user.id),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }

                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
