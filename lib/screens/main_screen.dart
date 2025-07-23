import 'package:cura/screens/doctors_screen.dart';
import 'package:cura/screens/home_screen.dart';
import 'package:cura/screens/notifications_screen.dart';
import 'package:cura/screens/profile_screen.dart';
import 'package:cura/utils/app_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int selectedIndex = 1;
  final List<Widget> _screens = const [
    HomeScreen(),
    DoctorsScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.blue.withOpacity(0),
        surfaceTintColor: Colors.transparent,

        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'welcome to',
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Cura',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: IndexedStack(index: selectedIndex, children: _screens),
      ),
      bottomNavigationBar: AppBottomNavbar(
        selectedIndex: selectedIndex,
        onTabSelected: (idx) => setState(() => selectedIndex = idx),
      ),
    );
  }
}
