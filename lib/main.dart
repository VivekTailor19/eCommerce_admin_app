import 'package:ecommerce_app/screens/01%20splash/splashScreen.dart';
import 'package:ecommerce_app/screens/03%20login/signInScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(

    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/signIn",
        routes: {
          "/":(p0) => SplashScreen(),
          "/signIn":(p0) => SignInScreen(),
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