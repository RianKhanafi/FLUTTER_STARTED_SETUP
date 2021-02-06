part of "services.dart";

// versi terbaru tidak suport AuthResult
class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Users user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SingInSignOutResult(users: user);
    } catch (e) {
      return SingInSignOutResult(message: e.toString().split(',')[1]);
    }
  }

  static Future<SingInSignOutResult> SignIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Users user = await result.user.formFireStore();

      return SingInSignOutResult(users: user);
    } catch (e) {
      return SingInSignOutResult(message: e.toString().split(',')[1]);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SingInSignOutResult {
  final Users users;
  final String message;

  SingInSignOutResult({this.users, this.message});
}
