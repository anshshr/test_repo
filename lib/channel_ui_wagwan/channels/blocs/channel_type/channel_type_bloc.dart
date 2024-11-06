import 'package:bloc/bloc.dart';
import 'package:wagwan/modules/channels/blocs/channel_type/channel_type_event.dart';
import 'package:wagwan/modules/channels/blocs/channel_type/channel_type_state.dart';


class ChannelTypeBloc extends Bloc<ChannelTypeEvent, ChannelTypeState> {
  ChannelTypeBloc() : super(const ChannelTypeInitial()) {
    on<PublicChannel>(selectpublic);
    on<PrivateChannel>(selectprivate);
  }

  void selectpublic(PublicChannel event, Emitter<ChannelTypeState> emit) {
    emit(const ChannelTypeInitial(publicChannel: true, priavteChannel: false));
  }

  void selectprivate(PrivateChannel event, Emitter<ChannelTypeState> emit) {
    emit(const ChannelTypeInitial(publicChannel: false, priavteChannel: true));
  }
}
