import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobprog_delacruz/widgets/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  static const List<Map<String, String>> _notifications = [
    {
      'name': 'Steve Rogers',
      'post': 'I can do this all day!',
      'description': 'Liked your post • 2m ago',
    },
    {
      'name': 'Jamal',
      'post': 'I saw a cop car today',
      'description': 'Commented on your post • 5m ago',
    },
    {
      'name': 'Patrick star',
      'post': 'Kamusta everyone!',
      'description': 'Shared your post • 10m ago',
    },
    {
      'name': 'SpongeBob',
      'post': 'Holiday season with ICpEP-NCR!',
      'description': 'Mentioned you in a post • 18m ago',
    },
    {
      'name': 'Mia Santos',
      'post': 'Late night Flutter coding',
      'description': 'Reacted to your photo • 25m ago',
    },
    {
      'name': 'Liam Cruz',
      'post': 'Debugging layout overflow',
      'description': 'Liked your comment • 32m ago',
    },
    {
      'name': 'Sophia Reyes',
      'post': 'Sunset view from rooftop',
      'description': 'Tagged you in a photo • 45m ago',
    },
    {
      'name': 'Noah Mendoza',
      'post': 'Quick study group later?',
      'description': 'Replied to your comment • 1h ago',
    },
    {
      'name': 'Chloe Garcia',
      'post': 'UI design systems',
      'description': 'Liked your post • 1h ago',
    },
    {
      'name': 'Ethan Dela Cruz',
      'post': 'Productive week ahead!',
      'description': 'Shared a memory with you • 2h ago',
    },
    {
      'name': 'Aria Villanueva',
      'post': 'Mobile Programming Lab 2',
      'description': 'Sent you a friend request • 2h ago',
    },
    {
      'name': 'Lucas Tan',
      'post': 'Weekend hackathon',
      'description': 'Invited you to an event • 3h ago',
    },
    {
      'name': 'Elena Navarro',
      'post': 'Coffee & Code',
      'description': 'Commented: Looks awesome! • 3h ago',
    },
    {
      'name': 'Marco Bautista',
      'post': 'Flutter ScreenUtil tips',
      'description': 'Liked your post • 4h ago',
    },
    {
      'name': 'Hannah Lim',
      'post': 'New project milestone',
      'description': 'Reacted ❤️ to your post • 5h ago',
    },
    {
      'name': 'Daniel Aquino',
      'post': 'Campus event photos',
      'description': 'Tagged you in an album • 6h ago',
    },
    {
      'name': 'Grace Torres',
      'post': 'Exam reviewer notes',
      'description': 'Shared a link in your group • 7h ago',
    },
    {
      'name': 'Gabriel Ramos',
      'post': 'Dark mode vs Light mode',
      'description': 'Voted in your poll • 8h ago',
    },
    {
      'name': 'Isabella Flores',
      'post': 'Morning jog update',
      'description': 'Liked your story • 9h ago',
    },
    {
      'name': 'Nathan Pascual',
      'post': 'Tech talk tomorrow',
      'description': 'Posted an update • 10h ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView.separated(
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = _notifications[index];
          return NotificationWidget(
            name: item['name']!,
            post: item['post']!,
            description: item['description']!,
          );
        },
      ),
    );
  }
}
