import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/bottom_nav_bar_entity.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

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
                setState(() {});
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.bottomNavBarEntity,
    required this.isSelected,
    this.onTap,
  });
  final BottomNavBarEntity bottomNavBarEntity;
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: isSelected
            ? ActiveBottomNavBarItem(
                image: bottomNavBarEntity.activeIcon,
                name: bottomNavBarEntity.name,
              )
            : InActiveBottomNavBarItem(image: bottomNavBarEntity.inactiveIcon),
      ),
    );
  }
}

class ActiveBottomNavBarItem extends StatelessWidget {
  const ActiveBottomNavBarItem({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: ShapeDecoration(
        color: const Color(0xFFEEEEEE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        spacing: 8,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: OvalBorder(),
            ),
            child: Center(child: SvgPicture.asset(image)),
          ),
          Expanded(
            child: Center(child: Text(name, style: AppTextStyles.semiBold13)),
          ),
        ],
      ),
    );
  }
}

class InActiveBottomNavBarItem extends StatelessWidget {
  const InActiveBottomNavBarItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(child: SvgPicture.asset(image)),
    );
  }
}
