

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task2/views/cart_screen.dart';
import 'package:pallife_task2/views/favorite_screen.dart';
import 'package:pallife_task2/views/home_screen.dart';
import 'package:pallife_task2/views/user_screen.dart';

class GroceryController extends GetxController{
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    UserScreen()
  ];

  void changeBottomNav(index){
    currentIndex = index;
    update();
  }

}