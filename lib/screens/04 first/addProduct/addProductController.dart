import 'package:get/get.dart';

class AddProductController extends GetxController
{
  RxBool isAdded = false.obs;

  List<String> categoryList = [
    "Clothes",
    "Shoes",
    "Kids",
    "Fitness",
    "Electronics",
    "Sports"
  ];

  RxString selCategory = "".obs;
}