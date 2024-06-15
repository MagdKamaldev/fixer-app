part of 'complains_cubit.dart';

sealed class ComplainsState {}

final class ComplainsInitial extends ComplainsState {}

final class ComplainsLoading extends ComplainsState {}

final class ComplainsLoaded extends ComplainsState {
  final List<MessegeModel> complains;
  ComplainsLoaded(this.complains);
}

final class ComplainsError extends ComplainsState {
  final String message;
  ComplainsError(this.message);
}

final class SendComplainSuccess extends ComplainsState {
  final String message;
  SendComplainSuccess(this.message);
}

final class SendComplainFailed extends ComplainsState {
  final String message;
  SendComplainFailed(this.message);
}

final class SendComplainLoading extends ComplainsState {}
