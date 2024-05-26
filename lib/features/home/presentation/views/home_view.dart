import 'package:fixer/core/widgets/screens/reviewing_screen.dart';
import 'package:fixer/features/home/presentation/views/widgets/app_drawer.dart';
import 'package:fixer/features/home/presentation/views/widgets/home_body.dart';
import 'package:fixer/features/login/data/repos/login_repository_implementation.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: isPending ? const ReviewingBody() : const HomeBody(),
    );
  }
}
