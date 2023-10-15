import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;
  //create Account
  Future<String> createAccount({required String email,required String password}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Account Created successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
    return "An error occured please try again";
  }
  //User SignIn

  Future<String> signInUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      return "Sign in successful";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
    return "Please try again";
  }

  //Reset Password
  Future<String> resetPassword({ required String emailAddress,}
    
  ) async {
    try {
      final credential = await auth.sendPasswordResetEmail(email: emailAddress);
      return "Email sent";
    } catch (e) {
      return "Error occured";
    }
  }

  //LogOut
  void signOut() {
    auth.signOut();
  }
}
