part of "services.dart";

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection("users");

  static Future<void> updateUser(Users users) async {
    String genres = "";

    for (var genre in users.selectedGenres) {
      genres += genre = ((genre != users.selectedGenres.last) ? "," : "");
    }

    _userCollection.document(users.id).setData({
      'email': users.email,
      'name': users.name,
      'balance': users.balance,
      'selectedGenres': users.selectedGenres,
      'selectedLanguage': users.selectedLanguage,
      'profilePicture': users.profilePicture ?? ""
    });
  }

  static Future<Users> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return Users(id, snapshot.data['email'],
        balance: snapshot.data['balance'],
        profilePicture: snapshot.data['profilePicture'],
        selectedGenres: (snapshot.data["selectedGenres"] as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.data["selectedLanguage"],
        name: snapshot.data['name']);
  }
}
