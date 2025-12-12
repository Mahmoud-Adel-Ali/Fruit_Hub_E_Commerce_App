import 'package:flutter/material.dart';

import '../../../domain/entities/bottom_nav_bar_entity.dart';
import 'bottom_nav_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavBarItems.asMap().entries.map((entry) {
          int index = entry.key;
          BottomNavBarEntity bottomNavBarEntity = entry.value;
          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: BottomNavBarItem(
              bottomNavBarEntity: bottomNavBarEntity,
              isSelected: selectedIndex == index,
              onTap: () {
                selectedIndex = index;
                widget.onItemTapped(index);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
