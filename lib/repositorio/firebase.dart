import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  Future<bool> registrarUsuario(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
  }
}
