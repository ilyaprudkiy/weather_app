import 'package:bloc/bloc.dart';
import '../../../../../core/result/result.dart';
import '../../../domain/use_cases/auth_use_cases.dart';

abstract class SignUpScreenState {}

class SignUpInitialState extends SignUpScreenState {}

class SignUpLoadingState extends SignUpScreenState {}

class SignUpErrorState extends SignUpScreenState {
  final String error;
  final String debugMessage;

  SignUpErrorState(this.error, this.debugMessage);
}

class SignUpSuccessState extends SignUpScreenState {}

class SignUpCubit extends Cubit<SignUpScreenState> {
  final AuthUseCase useCase;

  SignUpCubit(
    this.useCase,
  ) : super(SignUpInitialState());

  Future<void> signUp(String password, String email, String repeatPassword) async {
    emit(SignUpLoadingState());
    final res = await useCase.signUp(
        password: password, email: email, repeatPassword: repeatPassword);
    switch (res) {
      case Ok():
        emit(SignUpSuccessState());
      case Err():
        emit(SignUpErrorState(res.failure.message, 'SignUpCubit.signUp'));
    }
  }
}
