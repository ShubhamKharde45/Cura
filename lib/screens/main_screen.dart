import 'package:cura/screens/appointment_screen.dart';
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
  int selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    AppointmentScreen(),
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,

        title: const Text(
          'Cura',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 30,
            color: Colors.white,
          ),
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
