import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/services/data/reepos/services_repo_impl.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesView extends StatelessWidget {
  final int id;
  final String category;
  const ServicesView({super.key, required this.id, required this.category,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ServicesCubit(getIt<ServicesRepoImpl>())..getServices(id),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              " $category services",
              style: TextStyles.subHeadingsBold,
            ),
            centerTitle: true,
            toolbarHeight: 100,
          ),
          body: ServicesBody(id: id,)),
    );
  }
}
