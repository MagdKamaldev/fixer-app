import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).termsandconditions,
          style: TextStyles.subHeadings.copyWith(color: ColorManager.white),
        ),
        iconTheme: const IconThemeData(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).intoductions,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
              ),
            ),
            const SizedBox(height:6),
            Text(S.of(context).intoductionstext),
            const SizedBox(height: 16),
            Text(
              S.of(context).providedservices,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,

              ),
            ),
            const SizedBox(height: 6),
            Text(S.of(context).providedservicestext),
            const SizedBox(height: 16),
            Text(
              S.of(context).userresponsibilities,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,

              ),
            ),
            const SizedBox(height: 6),
            Text(S.of(context).userresponsibilitiestext),
            const SizedBox(height: 16),
            Text(
              S.of(context).paymentterms,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,

              ),
            ),
            const SizedBox(height: 6),
            Text(S.of(context).paymenttermstext),
            const SizedBox(height: 16),
            Text(
              S.of(context).limitationofliabilities,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,

              ),
            ),
            const SizedBox(height: 6),
            Text(S.of(context).limitationofliabilitiestext),
            const SizedBox(height: 16),
            Text(
              S.of(context).termination,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,

              ),
            ),
            const SizedBox(height: 6),
            Text(S.of(context).terminationtext),
            const SizedBox(height: 16),
            Text(
              S.of(context).changestoterms,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,

              ),
            ),
            const SizedBox(height: 6),
            Text(S.of(context).changestotermstext),
            const SizedBox(height: 16),
            Text(
              S.of(context).contactus,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,

              ),
            ),
            const SizedBox(height: 6),
            Text(S.of(context).contactustext),
          ],
        ),
      ),
    );
  }
}
