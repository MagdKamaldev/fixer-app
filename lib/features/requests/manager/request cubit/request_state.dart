part of 'request_cubit.dart';

sealed class RequestState {}

final class RequestInitial extends RequestState {}

final class RequestLoading extends RequestState {}

final class RequestSuccess extends RequestState {
  final int requestId;

  RequestSuccess(this.requestId);
}

final class RequestFailed extends RequestState {
  final String message;

  RequestFailed(this.message);
}

final class RequestCraftsmenLoading extends RequestState {}

final class RequestCraftsmenSuccess extends RequestState {
  final List<OrderCarftsmenModel> craftsmen;

  RequestCraftsmenSuccess(this.craftsmen);
}

final class RequestCraftsmenFailed extends RequestState {
  final String message;

  RequestCraftsmenFailed(this.message);
}
