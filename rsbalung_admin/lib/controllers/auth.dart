import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rsbalung_admin/services/auth.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();

  Stream<User?> authStateChanges = FirebaseAuth.instance.authStateChanges();

  signOut() {
    AuthFirebase.signOut();
    update();
  }
}
