import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // login
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      DocumentSnapshot userDoc = await _firestore.collection("Users").doc(userCredential.user!.uid).get();

      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
          'name': userDoc['name']
        }
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}