import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/widgets/screens/reviewing_screen.dart';
import 'package:fixer/features/home/presentation/views/widgets/app_drawer.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/home_body.dart';
import 'package:fixer/features/profile/presentation/views/profile_body.dart';
import 'package:fixer/features/stores/presentation/views/store_body.dart';
import 'package:fixer/features/login/data/repos/login_repository_implementation.dart';
import 'package:fixer/generated/l10n.dart';
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
    const Text("requests"),
    const StoresBody(),
    const ProfileBody(),
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
        gap: 3,
        padding: const EdgeInsets.all(12),
        curve: Curves.easeIn,
        tabMargin: const EdgeInsets.all(5),
        backgroundColor: ColorManager.greywhite,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: S.of(context).Home,
            iconSize: 25,
            iconColor: ColorManager.primary,
          ),
          GButton(
            icon: Icons.post_add_outlined,
            text: S.of(context).Requests,
            iconSize: 25,
            iconColor: ColorManager.primary,
          ),
          GButton(
            icon: Icons.store_outlined,
            text: S.of(context).Stores,
            iconSize: 25,
            iconColor: ColorManager.primary,
          ),
          GButton(
            icon: Icons.perm_identity,
            text: S.of(context).Profile,
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
