import 'package:elevate_online_exam_app/features/auth/presentation/screens/auth/login_screen.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/forget_password_view.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/otp_view.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/reset_password_view.dart';
import 'package:elevate_online_exam_app/features/home/presentation/screens/home_screen.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/screens/exam_question_screen.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/screens/exam_score.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/auth/register_screen.dart';
import '../../features/questions/domain/model/answer_model.dart';
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
        path: Routes.forgotPasswordScreen,
        builder: (context, state) => const ForgetPasswordView(),
      ),

      GoRoute(
        path: Routes.examScoreScreen,
        builder: (context, state) {
          final selectedAnswers = state.extra as List<AnswerModel>;
          return ExamScoreScreen(selectedAnswers: selectedAnswers);
        },
      ),

      GoRoute(
          path: Routes.otpScreen,
          builder: (context, state) {
            final email = state.extra as String;
            return OtpView(
              email: email,
            );
          }),
      GoRoute(
          path: Routes.examQuestionsScreen,
          builder: (context, state) => ExamQuestionsScreen()),

      GoRoute(
          path: Routes.resetPasswordScreen,
          builder: (context, state) {
            final email = state.extra as String;
            return ResetPasswordView(email: email);
          }),
      // GoRoute(
      //   path: Routes.onboardingScreen,
      //   builder: (context, state) => const OnboardingScreen(),
      // ),
      // GoRoute(
      //   path: Routes.loginScreen,
      //   builder: (context, state) => const LoginScreen(),
      // ),
      // GoRoute(
      //   path: Routes.homeScreen,
      //   builder: (context, state) => const HomeScreen(),
      // ),
      // Add more routes here...
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.uri.toString()}'),
      ),
    ),
  );
}
