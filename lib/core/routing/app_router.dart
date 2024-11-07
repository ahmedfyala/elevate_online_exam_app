import 'package:elevate_online_exam_app/features/auth/domain/contract/repository/auth_repo.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/screens/auth/login_screen.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/forget_password_view.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/otp_view.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/forget_password/reset_password_view.dart';
import 'package:elevate_online_exam_app/features/home/presentation/screens/home_screen.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/screens/exam_question_screen.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/screens/exam_score.dart';
import 'package:elevate_online_exam_app/features/results/data/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/presentation/screens/auth/register_screen.dart';
import '../../features/questions/domain/model/answer_model.dart';
import '../../features/results/data/model/selected_answers_model.dart';
import '../../features/results/presentation/screens/question_result_screen.dart';
import 'routes.dart';

@injectable
class AppRouter {
  final AuthRepo _authRepo;

  AppRouter(this._authRepo);

  bool isUserLoggedIn() {
    return _authRepo.getUser() != null;
  }

  GoRouter get router => GoRouter(
        initialLocation:
            isUserLoggedIn() ? Routes.homeScreen : Routes.loginScreen,
        routes: [
          GoRoute(
              path: Routes.loginScreen,
              builder: (context, state) => LoginScreen()),
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
            path: Routes.questionsResultScreen,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              final questions = data['questions'] as List<QuestionModel>;
              final selectedAnswers =
                  data['answers'] as List<SelectedAnswersModel>;
              return QuestionResultScreen(
                questions: questions,
                answers: selectedAnswers,
              );
            },
          ),
          GoRoute(
            path: Routes.examScoreScreen,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              final selectedAnswers =
                  data['selectedAnswers'] as List<AnswerModel>;
              final subjectId = data['subjectId'] as String;
              return ExamScoreScreen(
                  selectedAnswers: selectedAnswers, subjectId: subjectId);
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
          // Add more routes here...
        ],
        errorBuilder: (context, state) => Scaffold(
          body: Center(
            child: Text('No route defined for ${state.uri.toString()}'),
          ),
        ),
      );
}
