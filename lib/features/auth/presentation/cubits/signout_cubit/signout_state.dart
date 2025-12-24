part of 'signout_cubit.dart';

@immutable
sealed class SignoutState {}

final class SignoutInitial extends SignoutState {}

final class SignoutLoading extends SignoutState {}

final class SignoutSuccess extends SignoutState {}

final class SignoutFailure extends SignoutState {
  final String message;
  SignoutFailure({required this.message});
}
