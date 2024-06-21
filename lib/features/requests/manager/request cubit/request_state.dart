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

final class RequestReviewsLoading extends RequestState {}

final class RequestReviewsSuccess extends RequestState {
  final List<ReviewModel> reviews;

  RequestReviewsSuccess(this.reviews);
}

final class RequestReviewsFailed extends RequestState {
  final String message;

  RequestReviewsFailed(this.message);
}

final class SelectCraftsmanLoading extends RequestState {}

final class SelectCraftsmanSuccess extends RequestState {
  final String message;

  SelectCraftsmanSuccess(this.message);
}

final class SelectCraftsmanFailed extends RequestState {
  final String message;

  SelectCraftsmanFailed(this.message);
}
