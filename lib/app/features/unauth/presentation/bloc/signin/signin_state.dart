part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class InitialSigninState extends SigninState {}

class LoadingSigninState extends SigninState {
  const LoadingSigninState();
  @override
  List<Object> get props => [];
}

class FailureSigninState extends SigninState {
  final String message;
  const FailureSigninState({required this.message});
}
