import 'package:get/get.dart';

class CartDetailsController extends GetxController{

  List<dynamic> list = [{'name' : 'Zinger Burger','num' : 3},{'name' : 'Zinger Burger','num' : 4},{'name' : 'Zinger Burger','num' : 2}];

  void increment(index){
    list[index]['num']++;
    update();
  }

  void decrement(index){
    list[index]['num']--;
    update();
  }
  void deleteItem(index){
    list.removeAt(index);
    update();
  }
}