import 'package:firebase_auth/firebase_auth.dart';


class registroUsuarioFireBase{
  Future<bool>registrarusuarios(String email, String password)async{
    try{
      final credenciales=await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
        return true;
    }on FirebaseAuthException catch(e){
      print(e.code);
          return false;
    }
  }
}