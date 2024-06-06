import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/widgets/screens/reviewing_screen.dart';
import 'package:fixer/features/home/presentation/views/widgets/app_drawer.dart';
import 'package:fixer/features/home/presentation/views/widgets/home_body.dart';
import 'package:fixer/features/home/presentation/views/widgets/store_body.dart';
import 'package:fixer/features/login/data/repos/login_repository_implementation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // List of widgets corresponding to each tab
  final List<Widget> _widgetOptions = <Widget>[
    const HomeBody(),
    const Text("requets"),
    const StoresBody(),
    const Text("profile"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this to the desired color
        ),
      ),
      body: isPending
          ? const ReviewingBody()
          : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
        tabBackgroundColor: ColorManager.lightblue,
        tabBorderRadius: 150,
        color: ColorManager.primary,
        gap: 6,
        padding: const EdgeInsets.all(14),
        curve: Curves.easeIn,
        tabMargin: const EdgeInsets.all(8),
        backgroundColor: ColorManager.greywhite,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
            iconSize: 25,
            iconColor: ColorManager.primary,
          ),
          GButton(
            icon: Icons.wysiwyg_outlined,
            text: 'Requests',
            iconSize: 25,
            iconColor: ColorManager.primary,

          ),
          GButton(
            icon: Icons.store,
            text: 'Stores',
            iconSize: 25,
            iconColor: ColorManager.primary,

          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
            iconSize: 25,
            iconColor: ColorManager.primary,

          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
    );
  }
}
