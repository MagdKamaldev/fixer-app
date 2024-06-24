import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/features/payment/presentation/payment_view.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:fixer/features/requests/data/models/review_model.dart';
import 'package:fixer/features/requests/data/repos/request_repo_impl.dart';
import 'package:fixer/features/requests/presentation/views/widgets/available_craftmen.dart';
import 'package:fixer/features/requests/presentation/views/widgets/cancel_request_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

part 'request_state.dart';

String orderLocation = "Loading ...";

void getAdministrativeArea(LocationData location) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(location.latitude!, location.longitude!);
  orderLocation = placemarks[0].subAdministrativeArea!;
}

class RequestCubit extends Cubit<RequestState> {
  final RequestRepoImpl repo;
  RequestCubit(this.repo) : super(RequestInitial());

  static RequestCubit get(context) => BlocProvider.of(context);

  int? orderId;

  void request({
    required List<String> services,
    required String location,
    required String additional,
    required context,
  }) async {
    emit(RequestLoading());

    final result = await repo.request(services, additional, location);
    result.fold(
      (l) => emit(RequestFailed(l.message)),
      (r) {
        orderId = r;
        requestCraftsmen(context: context);
        emit(RequestSuccess(r));
      },
    );
  }

  List<OrderCarftsmenModel> craftsmen = [];

  void requestCraftsmen({required context}) async {
    emit(RequestCraftsmenLoading());

    final result = await repo.requestCraftsmen(
      orderId!,
    );
    result.fold((l) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CancelRequestBottomSheet(
            message: l.message,
          );
        },
      );
    }, (r) {
      craftsmen = r;
      navigateTo(
          context,
          AvailableCraftmen(
            craftsmen: craftsmen,
            orderId: orderId!,
          ));
      emit(RequestCraftsmenSuccess(r));
    });
  }

  List<ReviewModel> reviews = [];

  void craftsmanReviews(int craftsmanId) async {
    emit(RequestReviewsLoading());

    final result = await repo.craftsmanReviews(craftsmanId);
    result.fold((l) {
      emit(RequestReviewsFailed(l.message));
    }, (r) {
      reviews = r;
      emit(RequestReviewsSuccess(r));
    });
  }

  void selectCraftsman(
      int orderId, int craftsmanId, BuildContext context, Widget widget) async {
    emit(SelectCraftsmanLoading());

    final result = await repo.selectCraftsman(orderId, craftsmanId);
    result.fold((l) {
      emit(SelectCraftsmanFailed(l.message));
    }, (r) {
      navigateTo(context, widget);
      emit(SelectCraftsmanSuccess(r));
    });
  }

  void endRequest(
      int orderId, int rate, String feedBack, BuildContext context) async {
    emit(EndRequestLoading());

    final result = await repo.endRequest(orderId, rate, feedBack);
    result.fold((l) {
      emit(EndRequestFailed(l.message));
    }, (r) {
      navigateTo(
          context,
          PaymentView(
            orderId: orderId,
          ));
      emit(EndRequestSuccess(r));
    });
  }
}
