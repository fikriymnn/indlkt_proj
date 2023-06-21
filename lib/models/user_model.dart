import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String name;
  final String uid;

  final String username;
  final String role;

  final Timestamp createdAt;

  const UserModel({
    required this.username,
    required this.createdAt,
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      createdAt: snapshot["createdAt"],
      name: snapshot["name"],
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      role: snapshot["role"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "uid": uid,
        "email": email,
        "role": role,
        "createdAt": Timestamp.now()
      };
}
