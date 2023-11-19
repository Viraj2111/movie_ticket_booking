import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_booking/app.dart';
import 'package:movie_booking/components/colors.dart';
import 'package:movie_booking/pages/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/common_methos.dart';
import '../enums/lodingState.dart';

class AuthController extends GetxController {
  RxBool passwordVisible = false.obs;
  Rx<LoadingState> loginAuthState = LoadingState.noState.obs;
  Rx<LoadingState> registerAuthState = LoadingState.noState.obs;

  List iconList = [
    "assets/pngs/google_app.png",
    "assets/pngs/facebook_app.png",
  ];

//! LOGIN CONTROLLER

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//! REGISTER CONTROLLERS
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  //! LOGIN USER USING FIREBSE
  Future<void> login() async {
    try {
      loginAuthState.value = LoadingState.inprogress;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User user = userCredential.user!;
      await dataStorages.write("access_id", user.uid);
      await dataStorages.write("access_user", user);
      CommonMethod()
          .getXSnackBar("Login", "Log in successfully...", greenColor);
      loginAuthState.value = LoadingState.done;
      Get.offAll(() => HomeScreen(), transition: Transition.rightToLeft);
    } on FirebaseAuthException catch (e) {
      loginAuthState.value = LoadingState.error;
      CommonMethod().getXSnackBar(
          "Register", "Something went wrong please try again..", red);
    }
  }

//! Register New User
  Future<void> register() async {
    try {
      registerAuthState.value = LoadingState.inprogress;

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: registerEmailController.text,
        password: registerPasswordController.text,
      );
      User user = userCredential.user!;
      await dataStorages.write("access_id", user.uid);
      await dataStorages.write("access_user", user);
      await addUser();

      Get.offAll(() => HomeScreen(), transition: Transition.rightToLeft);

      CommonMethod().getXSnackBar(
          "Register", "User Register successfully...", greenColor);
      loginAuthState.value = LoadingState.done;
    } on FirebaseAuthException catch (e) {
      CommonMethod().getXSnackBar(
          "Register", "Something went wrong please try again..", red);
      loginAuthState.value = LoadingState.error;
      print('Error: $e');
    }
  }

  //! add user collection while register new user
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users.add({
      'name': registerNameController.text,
      'email': registerEmailController.text,
      'booked_seats': [],
      "id": dataStorages.read("access_id"),
    });
  }
}
