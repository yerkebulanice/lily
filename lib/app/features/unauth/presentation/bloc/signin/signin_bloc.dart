import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lily/app/features/unauth/presentation/bloc/auth/auth_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthBloc authBloc;

  SigninBloc({required this.authBloc}) : super(InitialSigninState()) {
    on<SigninEvent>((event, emit) async {
      if (event is ActivateSigninEvent) {
        authBloc.add(LogInAuthEvent());
        emit(InitialSigninState());
      }
      // as remote control to control outside from Apple or Google signin
      if (event is LoadingSigninEvent) {
        emit(const LoadingSigninState());
      }
      if (event is FailureSigninEvent) {
        emit(FailureSigninState(message: event.message));
      }
    });
  }
}
