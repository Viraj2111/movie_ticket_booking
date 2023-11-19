import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_booking/app.dart';
import 'package:movie_booking/components/colors.dart';
import 'package:movie_booking/components/common_methos.dart';

import '../enums/lodingState.dart';
import '../pages/login_screen.dart';

class HomeController extends GetxController {


  RxDouble shrinkprogress = 0.0.obs;
  ScrollController scrollController = ScrollController();

  final CollectionReference movies =
      FirebaseFirestore.instance.collection('movie_list');
  Map<String, dynamic>? data;
  RxInt len = 0.obs;
  RxList movieList = [].obs;
  RxList unavailableSeatList = [].obs;
  List movieIDList = [];
  RxList currentSelectionSeat = [].obs;

  Future<void> getMovieList() async {
    movieList.clear();

    try {
      QuerySnapshot querySnapshot = await movies.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        data = documentSnapshot.data() as Map<String, dynamic>;
        len++;
        movieList.add(data);
        movieIDList.add(documentSnapshot.id);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //! GET USERS
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  Future<void> getUserData() async {
    try {
      QuerySnapshot querySnapshot = await users.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        data = documentSnapshot.data() as Map<String, dynamic>;
        if (data!["id"] == dataStorages.read("access_id")) {
          dataStorages.write("current_User_collection_id", documentSnapshot.id);
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  RxList selectedSeatsList = [].obs;
  Rx<LoadingState> seatBookingState = LoadingState.noState.obs;

  //! UPDATE MOVIE SEATS LIST
  void updateMovieFields(String documentId) async {
    try {
      seatBookingState.value = LoadingState.inprogress;
      CollectionReference movies =
          FirebaseFirestore.instance.collection('movie_list');
      DocumentReference movieDocument = movies.doc(documentId);
      await movieDocument.update({
        'booked_seats': selectedSeatsList,
      });
      clearData();
      getUserData();
      getMovieList();
      Get.back();
      seatBookingState.value = LoadingState.done;

      CommonMethod().getXSnackBar(
          "Booking", "Your Ticket has been booked successfully...", greenColor);
    } catch (e) {
      seatBookingState.value = LoadingState.error;

      CommonMethod().getXSnackBar(
          "Booking", "Something went wrong please try again..", red);
    }
  }

  clearData() {
    selectedSeatsList.clear();
    currentSelectionSeat.clear();
    movieIDList.clear();
  }

  //! USERS SEATS UPDATE
  CollectionReference updateUser =
      FirebaseFirestore.instance.collection('users');
  void updateUserSeat(String documentId) async {
    try {
      FirebaseFirestore.instance.collection('users');
      DocumentReference movieDocument = updateUser.doc(documentId);


      await movieDocument.update({
        'booked_seats': selectedSeatsList,
      });
      updateMovieFields(dataStorages.read("current_collection_id"));
    } catch (e) {
      print("ERROR ==> $e");
    }
  }

  //! LOGOUT
  final FirebaseAuth auth = FirebaseAuth.instance;
  logOut() async {
    await auth.signOut();
    await dataStorages.erase();
    Get.offAll(() => LoginScreen(), transition: Transition.rightToLeft);
  }
}
