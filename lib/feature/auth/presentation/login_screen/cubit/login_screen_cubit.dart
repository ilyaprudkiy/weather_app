import 'package:bloc/bloc.dart';
import 'package:weather_app/feature/auth/domain/use_cases/auth_use_cases.dart';
import '../../../../../core/result/result.dart';

abstract class LoginScreenState {}

class LoginScreenStateInitial extends LoginScreenState {}

class LoginScreenStateLoading extends LoginScreenState {}

class LoginScreenStateAuthorized extends LoginScreenState {}

class LoginScreenStateError extends LoginScreenState {
  final String? message;
  final String debugMessage;

  LoginScreenStateError(this.message, this.debugMessage);
}

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final AuthUseCase useCase;

  LoginScreenCubit(this.useCase) : super(LoginScreenStateInitial());

  Future<void> login(String password, String email) async {
    emit(LoginScreenStateLoading());
    final res = await useCase.login(password: password, email: email);
    switch (res) {
      case Ok():
        emit(LoginScreenStateAuthorized());
      case Err():
        emit(LoginScreenStateError(
            res.failure.message, 'LoginScreenCubit.login'));
    }
  }
}
