import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task2/controller/cart_details_controller.dart';
import 'package:pallife_task2/themes.dart';


class CartDetailsScreen extends StatelessWidget {
  //const CartDetailsScreen({Key? key}) : super(key: key);

  CartDetailsController controller = Get.put(CartDetailsController(),permanent: true );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 30,
          ),
        ),
        title: Text(
          'Cart',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Column(
          children: [
            GetBuilder<CartDetailsController>(
              builder: (controller){
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index) => buildCartItem(index),
                      separatorBuilder: (context,index) => SizedBox(height: 20,),
                      itemCount: controller.list.length
                  ),
                );
              },

            ),
            SizedBox(height: 50,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                ),
                onPressed: (){},
                child: Text(
                    'Check Out'
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildCartItem(index){
    return Dismissible(
      onDismissed: (direction){
        controller.deleteItem(index);
      },
      key: UniqueKey(),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.1))
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children:
            [
              Image(
                image: NetworkImage('https://www.pngmart.com/files/16/Classic-Cheese-Burger-PNG-Image.png'
                ),
                //fit: BoxFit.cover,
                height: 50,
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Expanded(
                    child: Text(
                      '${controller.list[index]['name']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '\$ 5.5',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                [
                  InkWell(
                      onTap: (){
                        controller.deleteItem(index);
                      },
                      child: Icon(
                        Icons.delete_outline_outlined,
                      ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.decrement(index);
                         },
                        child: CircleAvatar(
                          backgroundColor: defaultColor,
                          radius: 15,
                          child: Icon(
                              Icons.remove,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '${controller.list[index]['num']}',
                         // '${item['num']}',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.increment(index);
                        },
                        child: CircleAvatar(
                          backgroundColor: defaultColor,
                          radius: 15,
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
