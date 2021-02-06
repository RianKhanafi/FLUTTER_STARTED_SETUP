part of 'extensions.dart';

// versi terbaru tidak support FirebaseUser
extension FirebaseUserExtension on FirebaseUser {
  Users convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      Users(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<Users> formFireStore() async => await UserServices.getUser(this.uid);
}
