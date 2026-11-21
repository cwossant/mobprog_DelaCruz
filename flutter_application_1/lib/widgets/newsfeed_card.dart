import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobprog_delacruz/constants.dart';
import 'package:mobprog_delacruz/widgets/custom_text.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numLikes;
  final bool hasImage;
  final String? imageUrl;
  final String? avatarUrl;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numLikes = 0,
    this.hasImage = false,
    this.imageUrl,
    this.avatarUrl,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilHeight = ScreenUtil().setHeight(5);
    final screenUtilTextSize = ScreenUtil().setSp(12);
    final likeCount = isLiked ? widget.numLikes + 1 : widget.numLikes;

    return Card(
      margin: EdgeInsets.all(screenUtilWidth),
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(20),
                  backgroundColor: Colors.grey[300],
                  backgroundImage: widget.avatarUrl == null
                      ? null
                      : widget.avatarUrl!.startsWith('assets/')
                      ? AssetImage(widget.avatarUrl!)
                      : NetworkImage(widget.avatarUrl!) as ImageProvider,
                  child: widget.avatarUrl == null
                      ? Icon(
                          Icons.person,
                          size: ScreenUtil().setSp(28),
                          color: Colors.grey[700],
                        )
                      : null,
                ),
                SizedBox(width: ScreenUtil().setWidth(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.userName,
                      fontSize: screenUtilTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: widget.date,
                      fontSize: ScreenUtil().setSp(10),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenUtilHeight),
            CustomText(
              text: widget.postContent,
              fontSize: screenUtilTextSize,
              color: Colors.black,
            ),
            SizedBox(height: screenUtilHeight),
            if (widget.hasImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: ScreenUtil().setHeight(220),
                  width: double.infinity,
                  child: widget.imageUrl?.startsWith('assets/') ?? false
                      ? Image.asset(
                          widget.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[200],
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.broken_image_outlined,
                                  size: 48,
                                  color: Colors.grey,
                                ),
                              ),
                        )
                      : Image.network(
                          widget.imageUrl ??
                              'https://images.unsplash.com/photo-1519608487953-e999c86e7455'
                                  '?auto=format&fit=crop&w=800&q=80',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[200],
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.broken_image_outlined,
                                  size: 48,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                ),
              ),
            SizedBox(height: screenUtilHeight),
            Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: fbPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                CustomText(
                  text: likeCount.toString(),
                  fontSize: screenUtilTextSize,
                  color: Colors.grey[700]!,
                ),
                const Spacer(),
                CustomText(
                  text: '42 Comments  5 Shares',
                  fontSize: ScreenUtil().setSp(10),
                  color: Colors.grey[700]!,
                ),
              ],
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: isLiked ? fbPrimary : Colors.grey,
                            size: screenUtilTextSize,
                          ),
                          SizedBox(width: 6),
                          CustomText(
                            text: 'Like',
                            fontSize: screenUtilTextSize,
                            color: isLiked ? fbPrimary : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.comment_outlined,
                            color: Colors.grey,
                            size: screenUtilTextSize,
                          ),
                          SizedBox(width: 6),
                          CustomText(
                            text: 'Comment',
                            fontSize: screenUtilTextSize,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: Colors.grey,
                            size: screenUtilTextSize,
                          ),
                          SizedBox(width: 6),
                          CustomText(
                            text: 'Share',
                            fontSize: screenUtilTextSize,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.person, size: 10, color: Colors.grey),
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
