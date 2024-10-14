import 'package:elevate_online_exam_app/features/auth/presentation/screens/auth/login_screen.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/forget_password_view.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/otp_view.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/reset_password_view.dart';
import 'package:elevate_online_exam_app/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/auth/register_screen.dart';
import 'routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.loginScreen,
    routes: [
      GoRoute(
          path: Routes.loginScreen, builder: (context, state) => LoginScreen()),
      GoRoute(
          path: Routes.registerScreen,
          builder: (context, state) => RegisterScreen()),
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.otpScreen,
        builder: (context, state) => const OtpView(),
      ),
      GoRoute(
        path: Routes.forgotPasswordScreen,
        builder: (context, state) =>  ForgetPasswordView(),
      ),
      GoRoute(
        path: Routes.resetPasswordScreen,
        builder: (context, state) =>  ResetPasswordView(),
      ),

    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.uri.toString()}'),
      ),
    ),
  );
}
