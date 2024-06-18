
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_body.dart';
import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final String serviceType = ModalRoute.of(context)!.settings.arguments as String? ??"unknown";
    return Scaffold(
      appBar: AppBar(title: Text(" $serviceType services",style: TextStyles.subHeadingsBold,) ,
      centerTitle: true,
      toolbarHeight: 100,
      ),
      body: const ServicesBody()
    );
  }
}