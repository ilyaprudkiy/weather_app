import 'package:bloc/bloc.dart';
import '../../../domain/use_cases/auth_use_cases.dart';


enum WelcomeScreenState { unknown, authorized, notAuthorized }

class WelcomeScreenCubit extends Cubit<WelcomeScreenState> {
  final AuthUseCase useCase;

  WelcomeScreenCubit(this.useCase) : super(WelcomeScreenState.unknown) {
    Future.microtask(_onState);
  }

  void _onState() {
    try {
      final session = useCase.getCurrentSession();
      if (session != null) {
        emit(WelcomeScreenState.authorized);
        return;
      }
      emit(WelcomeScreenState.notAuthorized);
    } catch (_) {
      emit(WelcomeScreenState.notAuthorized);
    }
  }
}