import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:weather_app/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signUp(String email, String password) async {
    await remoteDataSource.register(password: password, email: email);
  }

  @override
  Future<void> signIn(String email, String password) async {
    await remoteDataSource.login(password: password, email: email);
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.logout();
  }

  @override
  Session? get getCurrentSession {
    return remoteDataSource.getCurrentSession;
  }
}
