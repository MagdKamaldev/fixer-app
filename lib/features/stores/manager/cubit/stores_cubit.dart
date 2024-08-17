import 'package:fixer/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer/features/stores/data/models/stores_model.dart';
import 'package:fixer/features/stores/data/repos/stores_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  final StoresRepoImpl repo;
  StoresCubit(this.repo) : super(StoresInitial());
  static StoresCubit get(context) => BlocProvider.of(context);

  List<StoreModel> stores = [];

  void getStores() async {
    emit(StoresLoading());
    final response = await repo.getStores();
    response.fold(
      (l) {
        emit(StoresFailed(l.message));
      },
      (r) {
        stores = r;
        emit(StoresSuccess(r));
      },
    );
  }

  List<ItemModel> storeItems = [];

  void getStoreItems(int id) async {
    emit(GetStoreItemsLoading());
    final response = await repo.getStoreItems(id);
    response.fold(
      (l) {
        emit(GetStoreItemsFailed(l.message));
      },
      (r) {
        storeItems = r;
        emit(GetStoreItemsSuccess(r));
      },
    );
  }
}
