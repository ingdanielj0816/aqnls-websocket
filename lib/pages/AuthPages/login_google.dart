import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserData {
  final String? name;
  final String? email;

  UserData({this.name, this.email});
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<UserData?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null) {
      // Obtener los datos del usuario
      String? name = user.displayName;
      String? email = user.email;
      return UserData(name: name, email: email);
    }

    return null;
  } catch (e) {
    print("Error al iniciar sesión con Google: $e");
    return null;
  }
}
