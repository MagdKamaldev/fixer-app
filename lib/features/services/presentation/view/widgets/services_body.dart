import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_forms.dart';
import 'package:fixer/features/rating/presentation/views/widgets/comment_container.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:fixer/features/services/presentation/view/widgets/additional_info_container.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_wrap_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

  TextEditingController additionalInfocontroller = TextEditingController();

class ServicesBody extends StatelessWidget {
  final int id;
  const ServicesBody({
    super.key,
    required this.id,
  });

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
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(30),
                    ServicesWrapRow(
                      services: state.services,
                      id: id,
                    ),
                    verticalSpace(30),
                    const AdditionalInfoContainer()
                  ],
                ),
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
