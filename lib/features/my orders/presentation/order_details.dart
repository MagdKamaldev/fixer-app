import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/my%20orders/presentation/order_item.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  final List<ServiceModel> model;
  const OrderDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).orderDeatils),
              centerTitle: true,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: ListView.separated(
                separatorBuilder: (context, index) => verticalSpace(12),
                itemCount: model.length,
                itemBuilder: (context, index) {
                  return OrderContainerModel(
                    text: model[index].name == null
                        ? "Unknown"
                        : model[index].name.toString(),
                    description: model[index].price.toString(),
                    backgroundpath: "assets/images/stores_background.jpg",
                  );
                  // return OrderDetailsModel(
                  //   id: orders[index].orderId!,
                  //   time: orders[index].date!,
    
                  //   price: services[index].price.toString(),
                  // );
                },
              ),
            ),
          );
  }
}

// OrderContainerModel(
//                       text: cubit.services[index].name == null
//                           ? "Unknown"
//                           : cubit.services[index].name.toString(),
//                       description: cubit.services[index].price.toString(),
//                       backgroundpath: "assets/images/stores_background.jpg",
//                     )
