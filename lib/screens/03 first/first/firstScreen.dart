import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/firebase_helper.dart';
import 'firstController.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  FirstController f_control = Get.put(FirstController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        floatingActionButton: Obx(
          () =>  Visibility(
            visible: f_control.bottomIndex.value == 0 ? true : false,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              elevation: 0,
              child: Icon(Icons.add_rounded,size: 23.sp,),
              onPressed: () {
                Get.toNamed("/addProduct",
                arguments: {
                  "status":"add",
                  "model":null
                });
              }
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

        body: Obx(()=> f_control.bottomSelectScreens[f_control.bottomIndex.value]),

        bottomNavigationBar: Obx( () =>  BottomNavigationBar(
              currentIndex: f_control.bottomIndex.value,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              onTap: (value) {
                f_control.bottomIndex.value = value;
              },

              showUnselectedLabels: false,
              unselectedIconTheme: IconThemeData(color: Colors.black45,size: 18.sp,),
              selectedIconTheme: IconThemeData(color: Colors.black,size: 20.sp,),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400,),
              selectedItemColor: Colors.black,
              selectedFontSize: 12.sp,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Order"),
                BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined),label: "Notification"),
                BottomNavigationBarItem(icon: Icon(Icons.person_3_rounded),label: "Profile"),
              ],
            ),
        ),

      ),
    );
  }
}
