import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/supabase_client/supabase_client_provider.dart';
import 'package:weather_app/feature/auth/data/data_sources/auth_remote_data_source.dart';

class SupabaseRemoteDataSource implements AuthRemoteDataSource {
  final SupabaseClientProvider provider;

  SupabaseRemoteDataSource(this.provider);

  SupabaseClient get _client => provider.client;

  @override
  Future<void> register(
      {required String password, required String email}) async {
    await _client.auth.signUp(password: password, email: email);
  }

  @override
  Future<void> login({required String password, required String email}) async {
    await _client.auth.signInWithPassword(password: password, email: email);
  }

  @override
  Future<void> logout() async {
    await _client.auth.signOut();
  }

  @override
  Session? get getCurrentSession {
    return _client.auth.currentSession;
  }
}
