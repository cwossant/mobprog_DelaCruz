import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobprog_delacruz/constants.dart';
import 'package:mobprog_delacruz/widgets/custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numLikes;
  final bool hasImage;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numLikes = 0,
    this.hasImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilHeight = ScreenUtil().setHeight(5);
    final screenUtilTextSize = ScreenUtil().setSp(12);

    return Card(
      margin: EdgeInsets.all(screenUtilWidth),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  size: ScreenUtil().setSp(40),
                  color: Colors.grey,
                ),
                SizedBox(width: ScreenUtil().setWidth(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: screenUtilTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: date,
                      fontSize: ScreenUtil().setSp(10),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenUtilHeight),
            CustomText(
              text: postContent,
              fontSize: screenUtilTextSize,
              color: Colors.black,
            ),
            SizedBox(height: screenUtilHeight),
            if (hasImage)
              SizedBox(
                height: ScreenUtil().setHeight(200),
                child: const Image(
                  image: AssetImage('assets/images/iron_man.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up,
                    color: fbPrimary,
                    size: screenUtilTextSize,
                  ),
                  label: CustomText(
                    text: numLikes.toString(),
                    fontSize: screenUtilTextSize,
                    color: fbDarkPrimary,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment,
                    color: fbDarkPrimary,
                    size: screenUtilTextSize,
                  ),
                  label: CustomText(
                    text: 'Comment',
                    fontSize: screenUtilTextSize,
                    color: fbDarkPrimary,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: fbDarkPrimary,
                    size: screenUtilTextSize,
                  ),
                  label: CustomText(
                    text: 'Share',
                    fontSize: screenUtilTextSize,
                    color: fbDarkPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 10,
                  color: Colors.grey,
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(10),
                    0,
                    ScreenUtil().setWidth(10),
                    0,
                  ),
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(25),
                  width: ScreenUtil().setWidth(330),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const CustomText(
                    text: 'Write a comment...',
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            const CustomText(
              text: 'View all comments',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
