import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/result/result.dart';

abstract class AuthRepository {
  Future<ResultVoid> signIn(String email, String password);

  Future<ResultVoid> signUp(String email, String password);

  Future<ResultVoid> signOut();

  Session? get getCurrentSession;
}
