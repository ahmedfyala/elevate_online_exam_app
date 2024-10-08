import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login_states.dart';
import 'package:elevate_online_exam_app/features/auth/usecases/login_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LogInScreenState> {
  LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(const InitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void login() async {
    emit(const LoadingState());
    if (formKey.currentState!.validate()) {
      var result = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      switch (result) {
        case Success<AppUser>():
          emit(SuccessState(result.data));
          break;
        case Fail<AppUser>():
          emit(ErrorState(result.exception));
          break;
        case Loading<AppUser>():
          emit(const LoadingState());
          break;
      }
    }
  }
}
