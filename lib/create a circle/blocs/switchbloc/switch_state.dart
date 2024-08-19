part of 'switch_bloc.dart';

sealed class SwitchState extends Equatable {
  const SwitchState();

  @override
  List<Object> get props => [];
}

 class SwitchInitial extends SwitchState {
  bool switch_condition = false;
  SwitchInitial({this.switch_condition = false});
  @override
  List<Object> get props => [switch_condition];
}
