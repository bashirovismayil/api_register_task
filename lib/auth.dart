abstract class AuthContract {
  Future<Map<String, String>> register(String email, String password);
}
