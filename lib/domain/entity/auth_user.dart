class AuthUser {
  final String id;
  final String email;
  final String? name;
  final DateTime? createdAt;
  final DateTime? lastSignInAt;

  const AuthUser({
    required this.id,
    required this.email,
    this.name,
    this.createdAt,
    this.lastSignInAt,
  });

  factory AuthUser.fromSupabaseUser(dynamic user) {
    return AuthUser(
      id: user.id,
      email: user.email ?? '',
      name: user.userMetadata?['name'] ?? user.userMetadata?['full_name'],
      createdAt: user.createdAt != null 
          ? DateTime.parse(user.createdAt) 
          : null,
      lastSignInAt: user.lastSignInAt != null 
          ? DateTime.parse(user.lastSignInAt) 
          : null,
    );
  }

  @override
  String toString() {
    return 'AuthUser(id: $id, email: $email, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthUser && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

