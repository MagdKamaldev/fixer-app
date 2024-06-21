// ignore_for_file: use_key_in_widget_constructors

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/payment/data/models/payment_models/order_sumary_model/order_sumary_model.dart';
import 'package:fixer/features/payment/data/models/payment_models/payment_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pricedetails extends StatelessWidget {
  final OrderSumaryModel model;

  const Pricedetails({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(24),
      color: ColorManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRowContainer(S.of(context).orderId, model.orderId.toString()),
          _buildRowContainer(S.of(context).clientName, model.clientName ?? ''),
          _buildRowContainer(
              S.of(context).craftsmanName, model.craftsmanName ?? ''),
          _buildRowContainer(
              S.of(context).requestStatus, model.done.toString()),
          verticalSpace(24),
          Text(
            S.of(context).pricedetails,
            style: TextStyles.bodybold,
          ),
          verticalSpace(16),
          Expanded(
            child: ListView.builder(
              itemCount: model.services!.length,
              itemBuilder: (context, index) {
                return _buildServiceRowContainer(
                  model.services![index].name!,
                  "${model.services![index].price} ج.م.",
                );
              },
            ),
          ),
          verticalSpace(16),
          _buildRowContainer(
              '${S.of(context).subtotal} (EPG)', '${model.total} LE'),
        ],
      ),
    );
  }

  Widget _buildRowContainer(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyles.bodybold.copyWith(color: ColorManager.white),
          ),
          Text(
            value,
            style: TextStyles.body.copyWith(color: ColorManager.white),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceRowContainer(String serviceName, String price) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: ColorManager.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            serviceName,
            style: TextStyles.body.copyWith(color: ColorManager.black),
          ),
          Text(
            price,
            style: TextStyles.body.copyWith(color: ColorManager.black),
          ),
        ],
      ),
    );
  }
}
