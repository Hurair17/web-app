import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import 'package:restaurant/ui/home_screen/home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Consumer(
        builder: (context, value, child) => Scaffold(
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Item(),
                  Divider(
                    thickness: 1.h,
                    height: 1.h,
                    indent: 20.w,
                    endIndent: 20.w,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Expanded(
        // height: 285.w,
        // width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    CupertinoIcons.dot_square,
                    color: Colors.green,
                  ),
                  Text(
                    'Sambar',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '₹ 100',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  RatingBar.builder(
                    itemSize: 15.r,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    width: 220.w,
                    child: ReadMoreText(
                      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' more',
                      trimExpandedText: ' less',
                      moreStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      lessStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 115.h,
                  width: 100.h,
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.amber,
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.vegrecipesofindia.com/wp-content/uploads/2021/05/sambar-1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  left: 15.w,
                  child: Container(
                    height: 30.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10.r,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
