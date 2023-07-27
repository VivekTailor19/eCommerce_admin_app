
import 'package:ecommerce_app/screens/04%20first/bottomOptionScreens/1%20home/homeScreen.dart';
import 'package:ecommerce_app/screens/04%20first/bottomOptionScreens/2%20order/orderScreen.dart';
import 'package:ecommerce_app/screens/04%20first/bottomOptionScreens/3%20notifications/notificationScreen.dart';
import 'package:ecommerce_app/screens/04%20first/bottomOptionScreens/4%20profile/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstController extends GetxController
{
  RxInt bottomIndex = 0.obs;

  List<Widget> bottomSelectScreens = [
    HomeScreen(),
    OrderScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];




}