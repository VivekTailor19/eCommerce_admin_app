import 'package:ecommerce_app/screens/04%20first/first/firstController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


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
                Get.toNamed("/addProduct");
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
              unselectedIconTheme: IconThemeData(color: Colors.black45,size: 25.sp,),
              selectedIconTheme: IconThemeData(color: Colors.black,size: 25.sp,),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400,),
              selectedItemColor: Colors.black,
              selectedFontSize: 14.sp,
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
