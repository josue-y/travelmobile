import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo_2/modelos/user.dart' as UsersApp;
import 'package:firebase_auth/firebase_auth.dart';


class Firebase {
  Future<String?> registrarUsuario(String email, String password) async {
    try {
      final credenciales = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credenciales.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String?> ingresarUsuario(String email, String password) async {
    try {
      final credenciales = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credenciales.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String> crearUsuario(UsersApp.Users users) async {
    try {
      final document = await FirebaseFirestore.instance.collection("usuarios").add(users.toJson());
      return users.uid;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }
}
