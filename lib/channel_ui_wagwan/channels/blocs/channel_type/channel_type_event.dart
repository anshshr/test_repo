
import 'package:equatable/equatable.dart';

sealed class ChannelTypeEvent extends Equatable {
  const ChannelTypeEvent();

  @override
  List<Object> get props => [];
}

class PublicChannel extends ChannelTypeEvent {}

class PrivateChannel extends ChannelTypeEvent {}
