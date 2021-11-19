import 'package:brawlteca/tools/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginBloc {
  final _prefs = PreferenciasUsuario.instance;

  Future<bool> signInGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      _prefs.setNombre = googleUser!.displayName;
      _prefs.setFoto = googleUser.photoUrl;
      _prefs.setEmail = googleUser.email;
      return true;
    } catch (e) {
      return false;
    }

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signOut() {
    FirebaseAuth.instance.signOut();

    _prefs.setEmail = "";
    _prefs.setFoto = "";
    _prefs.setNombre = "";
  }
}
