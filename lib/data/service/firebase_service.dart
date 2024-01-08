import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String? name,
    required String? nim,
    required String? email,
    required String? password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty ||
          nim!.isNotEmpty ||
          name!.isNotEmpty ||
          password!.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password!);

        UserModel userModel = UserModel(
          email: email,
          nim: nim!,
          name: name!,
          uid: user.user!.uid,
        );

        await _firestore.collection('users').doc(user.user!.uid).set(
              userModel.toJson(),
            );
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}

class UserModel {
  final String email;
  final String nim;
  final String name;
  final String uid;
  final String? as;

  UserModel(
      {required this.email,
      required this.name,
      required this.nim,
      required this.uid,
      this.as});

  Map<String, dynamic> toJson() => {
        "name": name,
        "nim": nim,
        "email": email,
        "uid": uid,
        "as": "user",
      };

  static UserModel? fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      name: snapshot['name'],
      nim: snapshot['nim'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      as: snapshot['as'],
    );
  }
}
