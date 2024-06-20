import 'package:fixer/features/craftsman_wallet/data/wallet_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepoImpl repo;
  WalletCubit(this.repo) : super(WalletInitial());

  static WalletCubit get(context) => BlocProvider.of(context);

  double amount = 0.0;

  void getWallet() async {
    emit(WalletLoading());

    final result = await repo.getWallet();
    result.fold(
      (l) => emit(WalletError(message: l.message)),
      (r) {
        amount = r;
        emit(WalletLoaded(r));
      },
    );
  }


}
