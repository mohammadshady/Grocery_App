import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task2/themes.dart';
import 'package:pallife_task2/views/cart_details_screen.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

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
          'Product Details',
        ),
        centerTitle: true,
        actions:  [
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: (){
                Get.to(()=> CartDetailsScreen());
              },
              icon: Icon(
                Icons.shopping_cart_sharp,
                size: 30,
                color: defaultColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                height: 200,
                width: double.infinity,
                decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.yellowAccent,
                        Colors.deepOrange,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                ),
                child: const Stack(
                  alignment: Alignment.topRight,
                  children:
                  [
                    Center(
                      child: Image(
                        image: NetworkImage('https://www.pngmart.com/files/16/Classic-Cheese-Burger-PNG-Image.png'
                        ),
                        fit: BoxFit.fill,
                        height: 70,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                          child: Icon(
                              Icons.favorite,
                            size: 20,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children:
                [
                  Expanded(
                    child: Text(
                      'Zinger Burger',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: defaultColor,
                        size: 30,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '(5.0)',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children:
                  [
                    Expanded(
                      child: Text(
                        '\$ 15.50',
                        style: TextStyle(
                          fontSize: 20,
                          color: defaultColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '(40 reviews)',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ],
                ),
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ReadMoreText(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. ',
                trimLines: 2,
                style: TextStyle(
                  color: Colors.grey
                ),
                //colorClickableText: Colors.grey,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read More',
                trimExpandedText: 'Read Less',
                moreStyle: TextStyle(fontSize: 14, color: defaultColor),
                lessStyle: TextStyle(fontSize: 14,color: defaultColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children:
                [
                  Text(
                    'Related Fast Food',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepOrangeAccent
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) => buildRelatedItem(),
                    separatorBuilder: (context,index) => SizedBox(width: 10,),
                    itemCount: 5
                ),
              ),
              SizedBox(height: 20,),
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
      ),
    );
  }

  Widget buildRelatedItem(){
    return Container(
      height: 180,
      width: 130,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.1))
      ),
      child:  Stack(
        alignment: Alignment.topRight,
        children:
        [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image(
                      image: NetworkImage('https://www.pngmart.com/files/16/Classic-Cheese-Burger-PNG-Image.png'
                      ),
                      //fit: BoxFit.cover,
                      //height: 10,
                    ),
                  ),
                  SizedBox(height:10,),
                  Row(
                    children:
                    [
                      const Expanded(
                        child: Text(
                          'Zinger Burger',
                          style: TextStyle(
                            fontSize: 14,
                            //fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: defaultColor,
                            size: 13,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '(5.0)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.deepOrangeAccent,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height:10,),
                  Row(
                    children:
                    [
                      Expanded(
                        child: Text(
                          '\$ 15.50',
                          style: TextStyle(
                            fontSize: 14,
                            color: defaultColor,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: defaultColor,
                        radius: 10,
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite,
              size: 20,
              color: defaultColor,
            ),
          ),
        ],
      ),

    );

  }
}
