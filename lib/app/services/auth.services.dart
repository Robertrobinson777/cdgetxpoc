import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User> onAuthChanged() {
    return _firebaseAuth.authStateChanges();
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    User result = (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return result.uid;
  }

  Future<String> signInWithGoogle() async {
    await _googleSignIn.signOut();
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    User user = _firebaseAuth.currentUser;
    return user.uid;
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String> signUp(
    String email,
    String password, {
    String username,
  }) async {
    User result = (await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return result.uid;
  }

  Future<User> getCurrentUser() async {
    User user = _firebaseAuth.currentUser;
    return user;
  }

  Future<String> getAccessToken() async {
    User user = await getCurrentUser();
    String tokenResult = await user.getIdToken();

    return tokenResult;
  }

  Future<String> getRefreshToken() async {
    User user = _firebaseAuth.currentUser;
    String tokenResult = await user.getIdToken(true);
    return tokenResult;
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<void> sendEmailVerification() async {
    User user = _firebaseAuth.currentUser;
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    User user = _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  @override
  Future<void> changeEmail(String email) async {
    User user = _firebaseAuth.currentUser;
    return user.updateEmail(email);
  }

  @override
  Future<void> changePassword(String password) async {
    User user = _firebaseAuth.currentUser;
    user.updatePassword(password).then((_) {
      print("Succesfull changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
    });
    return null;
  }

  @override
  Future<void> deleteUser() async {
    User user = _firebaseAuth.currentUser;
    user.delete().then((_) {
      print("Succesfull user deleted");
    }).catchError((error) {
      print("user can't be delete" + error.toString());
    });
    return null;
  }

  @override
  Future<void> sendPasswordResetMail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return null;
  }
}
