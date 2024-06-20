part of 'wallet_cubit.dart';


sealed class WalletState {}

final class WalletInitial extends WalletState {}

final class WalletLoading extends WalletState {}

final class WalletLoaded extends WalletState {
  final double amount;
  WalletLoaded(this.amount);
}

final class WalletError extends WalletState {
  final String message;
  WalletError({required this.message});
}


