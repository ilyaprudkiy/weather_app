import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/error/mappers/supabase_error_mapper.dart';
import 'package:weather_app/core/result/result.dart';
import 'package:weather_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:weather_app/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SupabaseErrorMapper errorMapper;

  AuthRepositoryImpl(this.remoteDataSource, this.errorMapper);

  @override
  Future<ResultVoid> signUp(String email, String password) async {
    try {
      await remoteDataSource.register(password: password, email: email);
      return okVoid;
    } catch (e) {
      return Err(errorMapper.map(e, context: 'AuthRepository.signUp'));
    }
  }

  @override
  Future<ResultVoid> signIn(String email, String password) async {
    try {
      await remoteDataSource.login(password: password, email: email);
      return okVoid;
    } catch (e) {
      return Err(errorMapper.map(e, context: 'AuthRepository.signIn'));
    }
  }

  @override
  Future<ResultVoid> signOut() async {
    try {
      await remoteDataSource.logout();
      return okVoid;
    } catch (e) {
      return Err(errorMapper.map(e, context: 'AuthRepository.logout'));
    }
  }

  @override
  Session? get getCurrentSession {
    return remoteDataSource.getCurrentSession;
  }
}
