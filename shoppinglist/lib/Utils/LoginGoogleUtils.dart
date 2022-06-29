/*import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //GOOGLE METHODS
  //signInWithGoogle
  Future<User> signInWithGoogle() async {
    log(TAG + ", signInWithGoogle() init...");

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    log(TAG +
        ", signInWithGoogle() googleUser email -> ${googleSignInAccount.email}");

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    User user = userCredential.user;

    return _isCurrentSignIn(user);
  }

  Future<User> _isCurrentSignIn(User user) async {
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      //todo a ido bien.
      log(TAG + ', signInWithGoogle succeeded: $user');

      return user;
    }
    //si no ha ido bien devolvemos un null.
    return null;
  }

  //signOutGoogle
  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    log(TAG + ", User Signed Out, Google.");
  }

//getUserGoogle
  GoogleSignInAccount getUserGoogle() {
    try {
      return googleSignIn.currentUser;
    } catch (error) {
      throw Exception("Algo ha ido mal recuperando googleSignIn.currentUser");
    }
  }
}*/
