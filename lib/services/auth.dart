import 'package:firebase_auth/firebase_auth.dart';
import 'package:fasochat_app/modal/user.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  /// CONDITION ? TRUE : FALSE
  User _userFromFirebaseUser(FirebaseUser user) {


    return user !=null ? User(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
      try{
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        FirebaseUser firebaseUser = result.user;
        return _userFromFirebaseUser(firebaseUser);
      } catch (e) {
        print(e.toString());
        return null;
      }
  }
}

