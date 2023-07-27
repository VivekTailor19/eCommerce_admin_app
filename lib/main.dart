import 'package:ecommerce_app/screens/01%20splash/splashScreen.dart';
import 'package:ecommerce_app/screens/03%20login/signInScreen.dart';
import 'package:ecommerce_app/screens/03%20login/successScreen.dart';
import 'package:ecommerce_app/screens/04%20first/addProduct/addProductScreen.dart';
import 'package:ecommerce_app/screens/04%20first/first/firstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'screens/03 login/signUpScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,

         //initialRoute: "/first",
        routes: {
          "/":(p0) => FirstScreen(),
        //  "/":(p0) => SplashScreen(),
          "/signIn":(p0) => SignInScreen(),
          "/signUp":(p0) => SignUpScreen(),
          "/successLogin":(p0) => Success_LoginScreen(),
          "/first":(p0) => FirstScreen(),
          "/addProduct":(p0) => AddProductScreen(),

        },
      ),
    ),
  );
}


/*
home == four bottom home, notification, order, profile
floating button add screen

 add show alert dialog category add and product add
 */