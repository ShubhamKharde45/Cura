import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const AppBottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(icon: CupertinoIcons.home, label: 'Home', index: 0),
          _navItem(icon: CupertinoIcons.calendar, label: 'Visit', index: 1),
          _navItem(icon: CupertinoIcons.bell, label: 'Updates', index: 2),
          _navItem(
            icon: CupertinoIcons.profile_circled,
            label: 'Profile',
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        height: 70,
        width: 90,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade900 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.green : Colors.white,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isSelected ? Colors.green : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
