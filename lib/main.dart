import 'package:booknoke/core/service_locator.dart';
import 'package:booknoke/core/theme/app_theme.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booknoke/features/shared/presentation/pages/onbording_screen.dart';
import 'package:booknoke/features/shared/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(), // Use the service locator
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookNook',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // themeMode: ThemeMode.light,
        // home: const WelcomePage()
        home:  OnbordingScreen(),
      ),
    );
  }
}
