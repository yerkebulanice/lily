part of 'type_bloc.dart';

abstract class TypeState extends Equatable {
  const TypeState();

  @override
  List<Object> get props => [];
}

class TypeInitial extends TypeState {}

class ChangeTypeState extends TypeState {
  final List<Type> type;
  const ChangeTypeState(this.type);
  @override
  List<Object> get props => [type];
}
