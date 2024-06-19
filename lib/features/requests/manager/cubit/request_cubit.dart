import 'package:flutter_bloc/flutter_bloc.dart';
part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());

  static RequestCubit get(context) => BlocProvider.of(context);

  String location = "";

  void changeLocation(String newLocation) {
    location = newLocation;
    emit(GetLocation());
  }
}
