import 'package:flutter/material.dart';
import 'package:mobprog_delacruz/widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Steve Rogers',
          postContent: 'I can do this all day! #AvengersAssemble',
          date: '2 hours ago',
          numLikes: 10,
          avatarUrl: 'https://i.pravatar.cc/150?img=12',
        ),
        NewsFeedCard(
          userName: 'Jamal',
          postContent: 'I saw a cop car today #PoliceChase #Exciting',
          date: 'December 1, 2023',
          numLikes: 1000,
          hasImage: true,
          avatarUrl: 'assets/images/profile.jpg',
          imageUrl: 'assets/images/copcar.jpg',
        ),
      ],
    );
  }
}
