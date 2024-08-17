import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/generated/l10n.dart';
import 'language_cubit.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LanguageCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).changeLanguage),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).selectLanguage,
              style: TextStyles.bodybold.copyWith(color: ColorManager.primary),
            ),
            const SizedBox(height: 20),
            ListTile(
              selectedColor: ColorManager.primary,
              iconColor: ColorManager.primary,
              title: Text(
                S.of(context).english,
                style: TextStyles.bodybold,
              ),
              leading: const Icon(Icons.translate, color: ColorManager.primary),
              onTap: () {
                languageCubit.changeLanguage(const Locale('en'));
              },
              trailing: BlocBuilder<LanguageCubit, Locale>(
                builder: (context, locale) {
                  if (locale.languageCode == 'en') {
                    return const Icon(Icons.check, color: ColorManager.primary);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            const Divider(color: ColorManager.grey),
            ListTile(
              selectedColor: ColorManager.primary,
              iconColor: ColorManager.primary,
              title: Text(
                S.of(context).arabic,
                style: TextStyles.bodybold,
              ),
              leading: const Icon(Icons.translate, color: ColorManager.primary),
              onTap: () {
                languageCubit.changeLanguage(const Locale('ar'));
              },
              trailing: BlocBuilder<LanguageCubit, Locale>(
                builder: (context, locale) {
                  if (locale.languageCode == 'ar') {
                    return const Icon(Icons.check, color: ColorManager.primary);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
