import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoadingAuthState()) {
    on<AuthEvent>((event, emit) async {
      // App first loaded
      if (event is AppStartedAuthEvent) {
        emit(LoadingAuthState());
        await Future.delayed(const Duration(milliseconds: 200));
        emit(UnauthenticatedAuthState());
      }

      // App login mechanism, we store user dataa
      if (event is LogInAuthEvent) {
        emit(LoadingAuthState());
        await Future.delayed(const Duration(milliseconds: 200));
        emit(AuthenticatedAuthState());
      }

      // App logout mechanism
      if (event is LogOutAuthEvent) {
        emit(LoadingAuthState());
        await Future.delayed(const Duration(milliseconds: 200));
        emit(UnauthenticatedAuthState());
      }

      if (event is RefreshAuthEvent) {
        if (state is AuthenticatedAuthState) {
          emit(AuthenticatedAuthState());
        }
      }

      // modify settings
      if (event is SyncWithCacheAuthEvent) {
        emit(AuthenticatedAuthState());
      }
    });
  }

  void signout() {
    add(LogOutAuthEvent());
  }
}
