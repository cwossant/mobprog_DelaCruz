import 'package:flutter/material.dart';
import 'package:mobprog_delacruz/constants.dart';
import 'package:mobprog_delacruz/screens/newsfeed_screen.dart';
import 'package:mobprog_delacruz/screens/notifications_screen.dart';
import 'package:mobprog_delacruz/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static const List<String> _titles = [
    'nihub',
    'Notifications',
    'Profile',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isHomeTab = _selectedIndex == 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: fbTextColorWhite,
        shadowColor: fbTextColorWhite,
        elevation: 0,
        title: CustomText(
          text: _titles[_selectedIndex],
          fontSize: isHomeTab ? 25 : 22,
          color: isHomeTab ? fbPrimary : fbDarkPrimary,
          fontFamily: isHomeTab ? 'Klavika' : 'Frutiger',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        children: const <Widget>[
          NewsFeedScreen(),
          NotificationScreen(),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: fbTextColorWhite,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: fbPrimary,
        unselectedItemColor: fbSecondary,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}