import '../../../../core/utils/app_images.dart';

class BottomNavBarEntity {
  final String name;
  final String activeIcon, inactiveIcon;

  BottomNavBarEntity({
    required this.name,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}

List<BottomNavBarEntity> bottomNavBarItems = [
  // home
  BottomNavBarEntity(
    name: 'الرئيسية',
    activeIcon: Assets.imagesActiveHomeIcon,
    inactiveIcon: Assets.imagesInActiveHomeIcon,
  ),
  // products
  BottomNavBarEntity(
    name: 'المنتجات',
    activeIcon: Assets.imagesActiveProductsIcon,
    inactiveIcon: Assets.imagesInActiveProductsIcon,
  ),
  // cart
  BottomNavBarEntity(
    name: 'السلة',
    activeIcon: Assets.imagesActiveCartIcon,
    inactiveIcon: Assets.imagesInActiveCartIcon,
  ),
  // profile
  BottomNavBarEntity(
    name: 'حسابي',
    activeIcon: Assets.imagesActiveProfileIcon,
    inactiveIcon: Assets.imagesInActiveProfileIcon,
  ),
];
