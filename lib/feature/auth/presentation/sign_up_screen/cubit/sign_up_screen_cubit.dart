import 'package:bloc/bloc.dart';
import '../../../domain/use_cases/auth_use_cases.dart';

abstract class SignUpScreenState {}

class SignUpInitialState extends SignUpScreenState {}

class LoadingStateSignUpScreen extends SignUpScreenState {}

class RegisteredStateSignUpScreen extends SignUpScreenState {}

class RegisteredUnStateSignUpScreen extends SignUpScreenState {}

class ErrorStateSignUpScreen extends SignUpScreenState {
  final String? error;

  ErrorStateSignUpScreen({required this.error});
}

class SignUpCubit extends Cubit<SignUpScreenState> {
  final AuthUseCase useCase;

  SignUpCubit(
    this.useCase,
  ) : super(SignUpInitialState());
}
