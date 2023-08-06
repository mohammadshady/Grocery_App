import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task2/controller/grocery_controller.dart';
import 'package:pallife_task2/themes.dart';

class GroceryLayout extends StatelessWidget {
  const GroceryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.menu_outlined,
              size: 30,
            ),
            title: Text(
              'Home',
            ),
            centerTitle: true,
            actions: [
              SizedBox(
                width: 50,
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
            ],
          ),
          body: GetBuilder<GroceryController>(
              init: GroceryController(),
              builder: (controller){
                return controller.screens[controller.currentIndex];
              },
          ),
          bottomNavigationBar: GetBuilder<GroceryController>(
            builder: (controller){
              return Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30), topLeft: Radius.circular(30)),

                  boxShadow: [
                    BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: BottomNavigationBar(
                    onTap: (index){
                      controller.changeBottomNav(index);
                    },
                    currentIndex: controller.currentIndex,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    unselectedItemColor: Colors.black,
                    items: [
                      controller.currentIndex == 0 ? BottomNavigationBarItem(
                          icon: CircleAvatar(
                            child: Icon(Icons.home,color: Colors.white,),
                            radius: 20,
                            backgroundColor: defaultColor,
                          ),
                          label: ''
                      ) : BottomNavigationBarItem(
                          icon: Icon(Icons.home,),
                          label: ''
                      ),
                      controller.currentIndex == 1 ? BottomNavigationBarItem(
                          icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: defaultColor,
                              child: Icon(Icons.shopping_cart_sharp,color: Colors.white,)),
                          label: ''
                      ) : BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart_sharp,),
                          label: ''
                      ),
                      controller.currentIndex == 2 ? BottomNavigationBarItem(
                          icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: defaultColor,
                              child: Icon(Icons.favorite,color: Colors.white,)),
                          label: ''
                      ) : BottomNavigationBarItem(
                          icon: Icon(Icons.favorite,),
                          label: ''
                      ),
                      controller.currentIndex == 3 ? BottomNavigationBarItem(
                          icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: defaultColor,
                              child: Icon(Icons.person,color: Colors.white,)),
                          label: ''
                      ) : BottomNavigationBarItem(
                          icon: Icon(Icons.person,),
                          label: ''
                      ),

                    ],
                  ),
                ),
              );
            },
            
          ),

        );
  }





}


