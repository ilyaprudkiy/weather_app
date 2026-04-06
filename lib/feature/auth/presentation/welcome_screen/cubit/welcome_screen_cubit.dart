import 'package:bloc/bloc.dart';
import 'package:weather_app/feature/auth/domain/repository/auth_repository.dart';

enum WelcomeScreenState { unknown, authorized, notAuthorized }

class WelcomeScreenCubit extends Cubit<WelcomeScreenState> {
  final AuthRepository repo;

  WelcomeScreenCubit(this.repo) : super(WelcomeScreenState.unknown){}


}
