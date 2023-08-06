
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pallife_task2/views/product_details_screen.dart';

import '../themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children:
          [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.withOpacity(0.1))
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ) ,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                      )
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/grocery-shop-safely-1585329663.jpg',),
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Row(
              children:
              [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
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
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => buildCategoryItem(),
                  separatorBuilder: (context,index) => SizedBox(width: 20,),
                  itemCount: 10
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Row(
              children:
              [
                Text(
                  'Fast Food',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
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
            SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1 / 1.5,
              children:
              List.generate(
                6,
                    (index) => buildFoodItem(),
              ),

            ),

          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(){
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            border:Border.all(
                color: Colors.grey.withOpacity(0.1)
            )
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Text(
            'Fast Food',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15
            ),
          ),
        )),
      ),
    );
  }

  Widget buildFoodItem(){
    return InkWell(
      onTap: (){
        Get.to(() => ProductDetailsScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.1))
        ),
        child:  Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children:
            [
              Expanded(
                child: Image(
                  image: NetworkImage('https://www.pngmart.com/files/16/Classic-Cheese-Burger-PNG-Image.png'
                  ),
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children:
                [
                  Text(
                    'Zinger Burger',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$45',
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children:
                  [
                    // Expanded(
                    //   child: IconScoreBar(
                    //     scoreIcon: Icons.star_rounded,
                    //     iconColor: defaultColor,
                    //     maxScore: 3,
                    //     score: 2,
                    //   ),
                    // ),
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: defaultColor,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,

                    ),
                    Spacer(),
                    Text(
                      '\$50',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                  ],
                ),
              ),
              Row(
                children:
                [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: defaultColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: (){},
                    child: Text(
                        'Add To Cart'
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: defaultColor,
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
