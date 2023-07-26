import 'package:ecommerce_app/screens/04%20first/first/firstController.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: f_control.bottomIndex.value,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (value) {
            f_control.bottomIndex.value = value;
          },


          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.black,size: 25.sp,),
          unselectedIconTheme: IconThemeData(color: Colors.black45,size: 25.sp,),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 13.sp,color: Colors.black),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 13.sp,color: Colors.black12),


          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined),label: "Notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person_3_rounded),label: "Profile"),

          ],

        ),
      ),
    );
  }
}
