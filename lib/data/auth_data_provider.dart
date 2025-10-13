import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataProvider {
  final _supabase = Supabase.instance.client;

  Future<void> registeredUserWithEmail(String password, String email) async {
    await _supabase.auth.signUp(password: password, email: email);
  }

  Future<void> authUserWithPassword(String password, String email) async {
    await _supabase.auth.signInWithPassword(password: password, email: email);
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
