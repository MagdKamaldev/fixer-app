import 'package:fixer/features/payment/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepoImpl repo;
  CheckoutCubit(this.repo) : super(CheckoutInitial());
  static CheckoutCubit get(context) => BlocProvider.of(context);

  void checkout({required PaymentIntentInputModel model}) async {
    emit(CheckoutLoading());
    try {
      await repo.makePayment(model: model);
      emit(CheckoutSuccess());
    } catch (e) {
      emit(CheckoutFailed(message: e.toString()));
    }
  }
}
