import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String name,
    required String email,
    required String number,
    required String passsword,
  }) async {
    String res = 'Some erro Occurred';
    try {
      if (name.isNotEmpty || email.isNotEmpty || passsword.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: passsword);
        print(cred.user!.uid);
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'name': name,
          'email': email,
          'number': number,
          'password': passsword,
          'image': null,
        });
        res = 'Success';
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

// Logg in

  Future<String> logginUser({
    required String email,
    required String passsword,
  }) async {
    String res = 'Some erro Occurred';
    try {
      if (email.isNotEmpty || passsword.isNotEmpty) {
        UserCredential cred = await _auth.signInWithEmailAndPassword(
            email: email.trim(), password: passsword);
        print(cred.user!.uid);

        res = 'Success';
      }
    } catch (err) {
      return err.toString();
    }

    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
