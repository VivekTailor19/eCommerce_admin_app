import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'subScreen/completed_Order.dart';
import 'subScreen/ongoing_Order.dart';


class OrderController extends GetxController
{

  RxInt selOrderTypeIndex = 0.obs;


  List<Widget> cartScreens = [
    OngoingScreen(),
    CompletedScreen(),
  ];

}