import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Welcome !"),
            Text("please login or sign up to continue out app"),

            Text("Email"),
            TextField(style: TextStyle(fontSize: 15.sp),
              controller: temail,

            ),
          ],
        ),
      ),
    );
  }
}
