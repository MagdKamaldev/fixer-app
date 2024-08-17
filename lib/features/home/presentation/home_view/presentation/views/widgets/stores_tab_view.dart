import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/container_model.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/shimmer_loading.dart';
import 'package:fixer/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer/features/stores/manager/cubit/stores_cubit.dart';
import 'package:fixer/features/stores/presentation/views/widgets/store_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Storestab extends StatelessWidget {
  const Storestab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoresCubit(getIt<StoresRepoImpl>())..getStores(),
      child: BlocBuilder<StoresCubit, StoresState>(builder: (context, state) {
        if (state is! StoresLoading) {
          StoresCubit cubit = StoresCubit.get(context);
          return ListView.builder(
            itemCount: cubit.stores.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      StoreDetails(
                        store: cubit.stores[index],
                      ));
                },
                child: ContainerModel(
                  text: cubit.stores[index].name!,
                  description: cubit.stores[index].description ?? "",
                  backgroundpath: "assets/images/stores_background.jpg",
                ),
              );
            },
          );
        } else {
          return const ShimmerLoading();
        }
      }),
    );
  }
}
