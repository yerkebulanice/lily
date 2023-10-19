part of 'type_bloc.dart';

abstract class TypeEvent extends Equatable {
  const TypeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTypeEvent extends TypeEvent {
  final int index;
  const ChangeTypeEvent(this.index);
}
