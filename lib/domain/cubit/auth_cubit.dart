// import 'package:bloc/bloc.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../entity/auth_user.dart';
//
// // Состояния авторизации
// abstract class AuthState {}
//
// class AuthInitial extends AuthState {}
//
// class AuthLoading extends AuthState {}
//
// class AuthAuthenticated extends AuthState {
//
//   AuthAuthenticated(this.user);
// }
//
// class AuthUnauthenticated extends AuthState {}
//
// class AuthError extends AuthState {
//   final String message;
//   final String? code;
//
//   AuthError(this.message, {this.code});
// }
//
// // События авторизации
// abstract class AuthEvent {}
//
// class AuthSignInRequested extends AuthEvent {
//   final String email;
//   final String password;
//
//   AuthSignInRequested(this.email, this.password);
// }
//
// class AuthSignUpRequested extends AuthEvent {
//   final String email;
//   final String password;
//
//   AuthSignUpRequested(this.email, this.password);
// }
//
// class AuthSignOutRequested extends AuthEvent {}
//
// class AuthCheckRequested extends AuthEvent {}
//
// class AuthCubit extends Cubit<AuthState> {
//   final AuthDataProvider _authDataProvider;
//
//   AuthCubit(this._authDataProvider) : super(AuthInitial()) {
//     // Проверяем авторизацию при инициализации
//     checkAuth();
//   }
//
//   /// Проверка текущего состояния авторизации
//   void checkAuth() {
//     emit(AuthLoading());
//
//     try {
//       final user = _authDataProvider.getCurrentUser();
//       if (user != null) {
//         final authUser = AuthUser.fromSupabaseUser(user);
//         emit(AuthAuthenticated(authUser));
//       } else {
//         emit(AuthUnauthenticated());
//       }
//     } catch (e) {
//       emit(AuthError(_handleError(e)));
//     }
//   }
//
//   /// Авторизация пользователя
//   Future<void> signIn(String email, String password) async {
//     emit(AuthLoading());
//
//     try {
//       final response = await _authDataProvider.signInWithEmail(
//         email: email,
//         password: password,
//       );
//
//       if (response.user != null) {
//         final authUser = AuthUser.fromSupabaseUser(response.user!);
//         emit(AuthAuthenticated(authUser));
//       } else {
//         emit(AuthError('Ошибка авторизации: пользователь не найден'));
//       }
//     } catch (e) {
//       emit(AuthError(_handleError(e)));
//     }
//   }
//
//   /// Регистрация пользователя
//   Future<void> signUp(String email, String password) async {
//     emit(AuthLoading());
//
//     try {
//       final response = await _authDataProvider.signUpWithEmail(
//         email: email,
//         password: password,
//       );
//
//       if (response.user != null) {
//         final authUser = AuthUser.fromSupabaseUser(response.user!);
//         emit(AuthAuthenticated(authUser));
//       } else {
//         emit(AuthError('Ошибка регистрации: не удалось создать пользователя'));
//       }
//     } catch (e) {
//       emit(AuthError(_handleError(e)));
//     }
//   }
//
//   /// Выход из системы
//   Future<void> signOut() async {
//     emit(AuthLoading());
//
//     try {
//       await _authDataProvider.signOut();
//       emit(AuthUnauthenticated());
//     } catch (e) {
//       emit(AuthError(_handleError(e)));
//     }
//   }
//
//   /// Обработка ошибок Supabase
//   String _handleError(dynamic error) {
//     if (error is AuthException) {
//       switch (error.message) {
//         case 'Invalid login credentials':
//           return 'Неверный email или пароль';
//         case 'Email not confirmed':
//           return 'Email не подтвержден. Проверьте почту';
//         case 'User already registered':
//           return 'Пользователь с таким email уже зарегистрирован';
//         case 'Password should be at least 6 characters':
//           return 'Пароль должен содержать минимум 6 символов';
//         case 'Unable to validate email address: invalid format':
//           return 'Неверный формат email адреса';
//         default:
//           return error.message;
//       }
//     } else if (error is PostgrestException) {
//       switch (error.code) {
//         case '23505':
//           return 'Пользователь с таким email уже существует';
//         case '23503':
//           return 'Ошибка связи с базой данных';
//         default:
//           return 'Ошибка базы данных: ${error.message}';
//       }
//     } else if (error is SocketException) {
//       return 'Ошибка сети. Проверьте подключение к интернету';
//     } else if (error is TimeoutException) {
//       return 'Превышено время ожидания. Попробуйте еще раз';
//     } else {
//       return 'Произошла неизвестная ошибка: ${error.toString()}';
//     }
//   }
// }
//
