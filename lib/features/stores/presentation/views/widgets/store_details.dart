import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/shimmer_loading.dart';
import 'package:fixer/features/stores/data/models/stores_model.dart';
import 'package:fixer/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer/features/stores/manager/cubit/stores_cubit.dart';
import 'package:fixer/features/stores/presentation/views/widgets/item_container_model.dart';
import 'package:fixer/features/stores/presentation/views/widgets/searchbar_container.dart';
import 'package:fixer/features/stores/presentation/views/widgets/store_stack_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetails extends StatelessWidget {
  final StoreModel store;
  const StoreDetails({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        iconTheme: const IconThemeData(color: ColorManager.white),
      ),
      body: Container(
        color: ColorManager.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreStackContainer(
              store: store,
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: const SearchbarContainer(),
            ),
            verticalSpace(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                S.of(context).allItems,
                style: TextStyles.bodybold
                    .copyWith(color: ColorManager.black),
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => StoresCubit(getIt<StoresRepoImpl>())
                  ..getStoreItems(store.id!),
                child: BlocBuilder<StoresCubit, StoresState>(
                  builder: (context, state) {
                    if (state is StoresLoading) {
                      return const ShimmerLoading();
                    } else if (state is GetStoreItemsSuccess) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          itemCount: state
                              .storeItems.length, // Adjust to actual item count
                          itemBuilder: (context, index) => ItemConatinerModel(
                            item: state.storeItems[
                                index], // Adjust to actual item model
                          ),
                        ),
                      );
                    } else {
                      return const ShimmerLoading();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
