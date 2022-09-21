
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';

class AuthController extends GetxController {

  bool isvisible = false;

  bool ismarked = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = "";
  var displayUserPhoto = "";

  var googleSignIn = GoogleSignIn();

  void visibility() {
    isvisible = !isvisible;
    update();
  }

  void marked() {
    ismarked = !ismarked;
    update();
  }


  void signUpUsingFireBase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();

      Get.toNamed(Routes.loginScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = e.message.toString();

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        message = 'The account already exists for that email.';
      }

      Get.snackbar(
        title,
        message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.blue,
      );
    }
  }


  void logInUsingFireBase({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) => displayUserName = auth.currentUser!.displayName!);
      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = e.message.toString();

      if (e.code == 'user-not-found') {
        message = ' No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      Get.snackbar(
        title,
        message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.blue,
      );
    }
  }


  void googleSignUpApp() async {
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;

      update();

      Get.offNamed(Routes.mainScreen);

    }catch(error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.blue,
      );
    }

  }

  void facebookLogInRegistration()async {

    final LoginResult loginResult = await FacebookAuth.instance.login();

  }
  void resetPassword(String email)async{
    try {

      await auth.sendPasswordResetEmail(email: email);
      update();

      print("done");
      // Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code
          .replaceAll(RegExp('-'),' ')
          .capitalize!;
      String message = '' ;
      if (e.code == 'user-not-found') {
        print(' No user found for that email.');
      } else {
       print( e.message.toString());
      }
      Get.snackbar(
        title,
        message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.blue,
      );
    }
  }

  void logOutFromApp()async {

    try{
      await auth.signOut();
      await googleSignIn.signOut();

      displayUserPhoto ="";
      displayUserName = "";

      update();
      Get.offNamed(Routes.welcomeScreen);


    }catch(error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.blue,
      );
    }

  }
}