import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/complains/data/repos/complains_repo_impl.dart';
import 'package:fixer/features/complains/manager/cubit/complains_cubit.dart';
import 'package:fixer/features/complains/presentation/widgets/messegs_tff.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_forms.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/service_locator/service_locator.dart';

class AddComplain extends StatefulWidget {
  const AddComplain({super.key});

  @override
  State<AddComplain> createState() => _AddComplainState();
}

class _AddComplainState extends State<AddComplain> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController messegeController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    return BlocProvider(
      create: (context) => ComplainsCubit(getIt<ComplainsRepoImpl>()),
      child: BlocBuilder<ComplainsCubit, ComplainsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).addComplain,
                style: TextStyles.headings,
              ),
              toolbarHeight: 80.h,
              centerTitle: true,
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(30),
                      Text(
                        S.of(context).contactMail,
                        style: TextStyles.bodybold,
                      ),
                      verticalSpace(20),
                      TextForm(
                          controller: mailController,
                          text: S.of(context).contactMail,
                          textInputType: TextInputType.emailAddress,
                          obscure: false),
                      verticalSpace(100),
                      Text(
                        S.of(context).complainMessage,
                        style: TextStyles.bodybold,
                      ),
                      verticalSpace(20),
                      LargeTextForm(
                          controller: messegeController,
                          text: S.of(context).complainMessage,
                          textInputType: TextInputType.emailAddress,
                          obscure: false),
                      verticalSpace(100),
                      if (state is SendComplainLoading)
                        const Center(child: CircularProgressIndicator()),
                      if (state is! SendComplainLoading)
                        DefaultButton(
                            text: S.of(context).confirm,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ComplainsCubit.get(context)
                                    .sendComplain(messegeController.text,
                                        mailController.text, context)
                                    .then((value) {
                                  ComplainsCubit.get(context)
                                      .getUserComplains();
                                });
                              }
                            })
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
