import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:fixer/features/requests/data/repos/request_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

part 'request_state.dart';

String orderLocation = "";

void getAdministrativeArea(LocationData location) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(location.latitude!, location.longitude!);
  orderLocation = placemarks[0].subAdministrativeArea!;
}

class RequestCubit extends Cubit<RequestState> {
  final RequestRepoImpl repo;
  RequestCubit(this.repo) : super(RequestInitial());

  static RequestCubit get(context) => BlocProvider.of(context);

  int ? orderId;

  void request(
      {required List<String> services, required String location}) async {
    emit(RequestLoading());

    final result = await repo.request(services);
    result.fold(
      (l) => emit(RequestFailed(l.message)),
      (r) {
        orderId = r;
        requestCraftsmen(location: location);
        emit(RequestSuccess(r));
      },
    );
  }

  List<OrderCarftsmenModel> craftsmen = [];

  void requestCraftsmen({required String location}) async {
    emit(RequestCraftsmenLoading());

    final result = await repo.requestCraftsmen(orderId!, location);
    result.fold((l) => emit(RequestCraftsmenFailed(l.message)), (r) {
      craftsmen = r;
      emit(RequestCraftsmenSuccess(r));
    });
  }
}
