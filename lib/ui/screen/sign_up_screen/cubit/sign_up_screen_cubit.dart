import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../../domain/repository/auth_repository.dart';

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
  final AuthRepository _authRepository;

  SignUpCubit(this._authRepository) : super(SignUpInitial());

  Future registeredUser(String email, String password) async {
    emit(LoadingStateSignUpScreen());
    try{
      await _authRepository.signUp(email, password);
      emit(RegisteredStateSignUpScreen());
    }catch(e){
      emit(ErrorStateSignUpScreen(error: 'Ошибка регистрации '));
    }


  }
}
