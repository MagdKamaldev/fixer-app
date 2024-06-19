import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_wrap_row.dart';
import 'package:fixer/features/stores/presentation/views/widgets/searchbar_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesBody extends StatelessWidget {
  final int id;
  const ServicesBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        if (state is ServicesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServicesError) {
          return Center(child: Text(state.message));
        } else if (state is ServicesLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SearchbarContainer(),
                  verticalSpace(30),
                  ServicesWrapRow(
                    services: state.services,
                    id: id,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
