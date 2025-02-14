import 'package:codebase_assignment/core/dependency_injection.dart';
import 'package:codebase_assignment/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:codebase_assignment/utils/themes/theme_data.dart';
import 'package:codebase_assignment/features/dashboard/presentation/blocs/user_detail_bloc/user_data_bloc.dart';
import 'package:codebase_assignment/features/dashboard/domain/usecases/get_user_usecase.dart';

void main() async{
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(
              create: (context) => UserBloc(sl<GetUsersUseCase>()),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter ScreenUtil Demo',
            theme: lightTheme,
            routerConfig: appRouter, 
          ),
        );
      },
    );
  }
}
