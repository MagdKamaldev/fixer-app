import 'package:fixer/features/home/presentation/views/widgets/store_body.dart';
import 'package:flutter/material.dart';

class StoresviewAll extends StatelessWidget {
  const StoresviewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: const StoresBody(),
    );
  }
}