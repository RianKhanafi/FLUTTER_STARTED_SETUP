part of "models.dart";

class Users extends Equatable {
  final String id;
  final String email;
  final String name;
  final String password;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  Users(this.id, this.email,
      {this.password,
      this.name,
      this.profilePicture,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance});

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        password,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
