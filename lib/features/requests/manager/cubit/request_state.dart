part of 'request_cubit.dart';
sealed class RequestState {}

final class RequestInitial extends RequestState {}

final class GetLocation extends RequestState {}
