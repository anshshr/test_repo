import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/bloc/profile_tab_event.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/bloc/profile_tab_state.dart';

class ProfileTabBloc extends Bloc<ProfileTabEvent, ProfileTabState> {
  ProfileTabBloc() : super(TabState(0)) {
    on<TabSelected>((event, emit) {
      emit(TabState(event.index));
    });
  }
}