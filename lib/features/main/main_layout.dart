import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/features/main/categories/presentation/screen/categories_tab.dart';
import 'package:ecommerce_app/features/main/favourites/screens/favourites_tab.dart';
import 'package:flutter/material.dart';

import 'home/presentation/screens/home_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    const CategoriesTab(),
    const FavouritesTab(),
    const CategoriesTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      extendBody: false,
      body: tabs[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => changeSelectedIndex(value),
          backgroundColor: ColorManager.primary,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.white,
          showSelectedLabels: false, // Hide selected item labels
          showUnselectedLabels: false, // Hide unselected item labels
          items: [
            // Build BottomNavigationBarItem widgets for each tab
            CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
            CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
            CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
            CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
          ],
        ),
      ),
    );
  }

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath), // Inactive icon image
            color: ColorManager.white, // Inactive icon color
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white, // Background of active icon
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager
                  .primary, // Active icon imagecolor: ColorManager.primary, // Active icon color
            ),
          ),
        );
}
