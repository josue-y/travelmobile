import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo_2/modelos/clasesitio.dart';
import 'package:ejemplo_2/modelos/user.dart';
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

  Future<String?> loginUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String> crearUsuario(Users users) async {
    try {
      final document = await FirebaseFirestore.instance
          .collection("Usuarios")
          .doc(users.uid)
          .set(users.toJson());
      return users.uid;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String> crearSitio(Sitio sitio) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final documento = FirebaseFirestore.instance
          .collection("Usuarios")
          .doc(uid)
          .collection("Sitios")
          .doc();
      sitio.id = documento.id;
      final resultado = FirebaseFirestore.instance
          .collection("Usuarios")
          .doc(uid)
          .collection("Sitios")
          .doc(sitio.id)
          .set(sitio.toJson());
      return sitio.id;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }
}
