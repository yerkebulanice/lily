part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

///When user already authenticated to the system
class AuthenticatedAuthState extends AuthState {
  AuthenticatedAuthState();

  @override
  List<Object> get props => [];
}

class UnauthenticatedAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadingAuthState extends AuthState {
  @override
  List<Object> get props => [];
}
