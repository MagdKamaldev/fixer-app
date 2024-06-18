import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/features/services/data/reepos/services_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepoImpl repo;
  ServicesCubit(this.repo) : super(ServicesInitial());

  static ServicesCubit get(context) => BlocProvider.of(context);

  List<ServiceModel> services = [];

  void getServices(int category) async {
    emit(ServicesLoading());
   final result = await repo.getServices(category);
    result.fold(
      (l) => emit(ServicesError(message: l.message)),
      (r) {
        services = r;
        emit(ServicesLoaded(services));
      },
    );
  }
}
