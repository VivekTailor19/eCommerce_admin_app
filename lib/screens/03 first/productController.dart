import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
{
  RxBool isAdded = false.obs;

  List<String> categoryList = [
    "Electronics",
    "Clothes",
    "Shoes",
    "Kids",
    "Sports"
  ];

  RxString selCategory = "".obs;

  RxString filterCategory = "Electronics".obs;
  RxInt selFilterIndexCategory = 0.obs;


}