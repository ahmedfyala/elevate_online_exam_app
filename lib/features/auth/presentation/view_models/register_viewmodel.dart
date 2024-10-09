import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/auth_actions.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/auth_states.dart';
import 'package:elevate_online_exam_app/features/auth/usecases/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthState> {
  RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase) : super(const InitialState());
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void doAction(AuthActions action) {
    if (action is RegisterAction) {
      _register();
    }
  }

  void _register() async {
    emit(const LoadingState());
    if (formKey.currentState!.validate()) {
      try {
        var result = await _registerUseCase.invoke(
          userNameController.text,
          firstNameController.text,
          lastNameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text,
        );
        print(result);
        if (result is Success<AppUser>) {
          emit(SuccessState(result.data));
        } else if (result is Fail<AppUser>) {
          emit(ErrorState(result.exception));
        } else {
          emit(const LoadingState());
        }
      } catch (e) {
        emit(ErrorState(e as Exception?));
      }
    } else {
      print('Form validation failed'); // Debugging
    }
  }
}
