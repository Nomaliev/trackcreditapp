import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/features/authentication/screens/loginpage/login_page.dart';
import 'package:trackcreditapp/utilities/constans/exceptions/exceptions.dart';
import 'package:trackcreditapp/utilities/constans/exceptions/firebase_exceptions.dart';
import 'package:trackcreditapp/utilities/constans/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // screenRedirect() {
  //   if (_auth.currentUser != null) {
  //     Get.offAll(() => const HomePage());
  //   } else {
  //     Get.offAll(() => const LoginPage());
  //   }
  // }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const LoginPage());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
