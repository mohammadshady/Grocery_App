
import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pallife_task2/views/grocery_layout.dart';
import 'package:pallife_task2/views/home_screen.dart';

import '../themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => Get.to(GroceryLayout()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(
        backgroundColor: defaultColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: defaultColor,
            statusBarIconBrightness: Brightness.light
        ),
        elevation: 0,
      ),

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Groceries.png',height: 200,width: 250,fit: BoxFit.fill,),
            SizedBox(
              height: 20,
            ),
            Text(
              'Grocery App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),

    );
  }
}
