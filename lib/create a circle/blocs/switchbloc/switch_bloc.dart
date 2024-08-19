import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial()) {
    on<switchEnabled>(disable_switch);
    on<switchDisabled>(enable_switch);
  }

  FutureOr<void> enable_switch(
      switchDisabled event, Emitter<SwitchState> emit) {
    emit(SwitchInitial(switch_condition: true));
  }

  FutureOr<void> disable_switch(
      switchEnabled event, Emitter<SwitchState> emit) {
        emit(SwitchInitial(switch_condition: false));
      }
}
