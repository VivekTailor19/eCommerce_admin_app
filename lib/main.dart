import 'package:ecommerce_app/screens/01%20splash/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'screens/02 login/signInScreen.dart';
import 'screens/02 login/signUpScreen.dart';
import 'screens/02 login/successScreen.dart';
import 'screens/03 first/addProduct/addProductScreen.dart';
import 'screens/03 first/first/firstScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(p0) => SplashScreen(),
          // "/":(p0) => FirstScreen(),
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

