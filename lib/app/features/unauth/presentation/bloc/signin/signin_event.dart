part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class ActivateSigninEvent extends SigninEvent {
  const ActivateSigninEvent();

  @override
  List<Object> get props => [];
}

class LoadingSigninEvent extends SigninEvent {
  const LoadingSigninEvent();
}

class FailureSigninEvent extends SigninEvent {
  final String message;
  const FailureSigninEvent({required this.message});
}
