import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }
}
