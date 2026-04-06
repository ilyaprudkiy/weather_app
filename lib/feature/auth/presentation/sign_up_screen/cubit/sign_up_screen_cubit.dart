import 'package:bloc/bloc.dart';

abstract class SignUpScreenState {}

class SignUpInitial extends SignUpScreenState {}

class LoadingStateSignUpScreen extends SignUpScreenState {}

class RegisteredStateSignUpScreen extends SignUpScreenState {}

class RegisteredUnStateSignUpScreen extends SignUpScreenState {}

class ErrorStateSignUpScreen extends SignUpScreenState {
  final String? error;

  ErrorStateSignUpScreen({required this.error});
}

class SignUpCubit extends Cubit<SignUpScreenState> {
  SignUpCubit(super.initialState);
}
