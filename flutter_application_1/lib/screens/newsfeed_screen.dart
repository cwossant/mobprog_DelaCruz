import 'package:flutter/material.dart';
import 'package:mobprog_delacruz/widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  static const List<Map<String, dynamic>> _posts = [
    {
      'userName': 'Steve Rogers',
      'postContent': 'I can do this all day! #AvengersAssemble',
      'date': '2 hours ago',
      'numLikes': 120,
      'hasImage': false,
      'avatarUrl': 'https://i.pravatar.cc/150?img=12',
    },
    {
      'userName': 'Jamal',
      'postContent': 'I saw a cop car today #PoliceChase #Exciting',
      'date': 'December 1, 2023',
      'numLikes': 1000,
      'hasImage': true,
      'avatarUrl': 'assets/images/profile.jpg',
      'imageUrl': 'assets/images/copcar.jpg',
    },
    {
      'userName': 'Cyrus Robles',
      'postContent': 'Kamusta everyone! Ready for the weekend?',
      'date': 'October 11',
      'numLikes': 100,
      'hasImage': false,
      'avatarUrl': 'https://i.pravatar.cc/150?img=3',
    },
    {
      'userName': 'Roben Juanatas',
      'postContent': 'Kicking off the holiday season with ICpEP-NCR!',
      'date': 'December 2',
      'numLikes': 245,
      'hasImage': true,
      'avatarUrl': 'https://i.pravatar.cc/150?img=8',
      'imageUrl': 'https://images.unsplash.com/photo-1512389142860-9c449e58a543?auto=format&fit=crop&w=800&q=80',
    },
    {
      'userName': 'Mia Santos',
      'postContent': 'Late night Flutter coding session with coffee.',
      'date': '3 hours ago',
      'numLikes': 64,
      'hasImage': true,
      'avatarUrl': 'https://i.pravatar.cc/150?img=5',
      'imageUrl': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=800&q=80',
    },
    {
      'userName': 'Liam Cruz',
      'postContent': 'Finally finished debugging the layout overflow!',
      'date': 'Yesterday',
      'numLikes': 89,
      'hasImage': false,
      'avatarUrl': 'https://i.pravatar.cc/150?img=11',
    },
    {
      'userName': 'Sophia Reyes',
      'postContent': 'Sunset view from the campus rooftop.',
      'date': 'November 18',
      'numLikes': 312,
      'hasImage': true,
      'avatarUrl': 'https://i.pravatar.cc/150?img=9',
      'imageUrl': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80',
    },
    {
      'userName': 'Noah Mendoza',
      'postContent': 'Anyone up for a quick study group later?',
      'date': '5 hours ago',
      'numLikes': 27,
      'hasImage': false,
      'avatarUrl': 'https://i.pravatar.cc/150?img=14',
    },
    {
      'userName': 'Chloe Garcia',
      'postContent': 'Exploring UI design systems and custom color palettes.',
      'date': 'November 10',
      'numLikes': 154,
      'hasImage': true,
      'avatarUrl': 'https://i.pravatar.cc/150?img=16',
      'imageUrl': 'https://images.unsplash.com/photo-1558655146-9f40138edfeb?auto=format&fit=crop&w=800&q=80',
    },
    {
      'userName': 'Ethan Dela Cruz',
      'postContent': 'Grateful for another productive week ahead!',
      'date': 'Just now',
      'numLikes': 48,
      'hasImage': false,
      'avatarUrl': 'https://i.pravatar.cc/150?img=18',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          userName: post['userName'] as String,
          postContent: post['postContent'] as String,
          date: post['date'] as String,
          numLikes: post['numLikes'] as int,
          hasImage: post['hasImage'] as bool,
          avatarUrl: post['avatarUrl'] as String?,
          imageUrl: post['imageUrl'] as String?,
        );
      },
    );
  }
}
