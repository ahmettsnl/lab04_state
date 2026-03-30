class AuthService {
  static final Map<String, String> _users = {
    'admin': 'admin123',
    'student': 'student123',
    'ahmettsnll': 'ahmettsnll' ,
  };

  static bool login(String username, String password) {
    return _users[username] == password;
  }
}