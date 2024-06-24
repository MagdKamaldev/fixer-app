// ignore_for_file: library_private_types_in_public_api

import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/rating/presentation/views/widgets/comment_container.dart';
import 'package:fixer/features/rating/presentation/views/widgets/rating_stars.dart';
import 'package:fixer/features/rating/presentation/views/widgets/submit_botton.dart';
import 'package:fixer/features/requests/data/repos/request_repo_impl.dart';
import 'package:fixer/features/requests/manager/request%20cubit/request_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int stars = 1;
TextEditingController reviewController = TextEditingController();

class ExpandedContent extends StatefulWidget {
  final String? image;
  final int orderId;
  const ExpandedContent(
      {super.key, required this.image, required this.orderId});

  @override
  _ExpandedContentState createState() => _ExpandedContentState();
}

class _ExpandedContentState extends State<ExpandedContent> {
  int stars = 0;

  void updateRating(int newRating) {
    setState(() {
      stars = newRating;
    });
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(getIt<RequestRepoImpl>()),
      child: BlocBuilder<RequestCubit, RequestState>(
        builder: (context, state) => Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment:
                        locale == "en" ? Alignment.topRight : Alignment.topLeft,
                    child: InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: const Icon(
                          Icons.close,
                          color: ColorManager.primary,
                          size: 25,
                        )),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.image ??
                          "https://th.bing.com/th?id=OIP.TctatNGs7RN-Dfc3NZf91AAAAA&w=212&h=212&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
                      radius: 35,
                    ),
                    horizontalSpace(25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingStarsRow(
                          initialRating: stars,
                          onRatingChanged: updateRating,
                        ),
                        Text(
                          stars > 4
                              ? S.of(context).amazing
                              : stars > 3
                                  ? S.of(context).good
                                  : stars > 2
                                      ? S.of(context).fair
                                      : S.of(context).poor,
                          style: TextStyles.smallbold,
                        ),
                      ],
                    ),
                  ]),
                  verticalSpace(50),
                  const CommentContainer(),
                  verticalSpace(50),
                  if (state is EndRequestLoading)
                    const CircularProgressIndicator()
                  else
                    SubmitBotton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          RequestCubit.get(context).endRequest(widget.orderId,
                              stars, reviewController.text, context);
                        } else {
                          showErrorSnackbar(context, "Please enter a review");
                        }
                      },
                    ),
                ]),
          ),
        ),
      ),
    );
  }
}
