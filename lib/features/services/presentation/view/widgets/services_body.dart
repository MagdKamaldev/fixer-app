import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:fixer/features/services/presentation/view/widgets/additional_info_container.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_wrap_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesBody extends StatelessWidget {
  final int id;
  const ServicesBody({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController additionalInfocontroller = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        if (state is ServicesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServicesError) {
          return Center(child: Text(state.message));
        } else if (state is ServicesLoaded) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace(30),
                      ServicesWrapRow(
                        formKey: formKey,
                        additional: additionalInfocontroller.text,
                        services: state.services,
                        id: id,
                      ),
                      verticalSpace(30),
                      AdditionalInfoContainer(
                        additionalInfocontroller: additionalInfocontroller,
                      )
                    ],
                  ),
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
