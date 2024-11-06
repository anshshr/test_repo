import 'package:equatable/equatable.dart';

sealed class ChannelTypeState extends Equatable {
  const ChannelTypeState();

  @override
  List<Object> get props => [];
}

class ChannelTypeInitial extends ChannelTypeState {
  final bool publicChannel;
  final bool priavteChannel;

  const ChannelTypeInitial(
      {this.priavteChannel = false, this.publicChannel = true});
  @override
  List<Object> get props => [publicChannel, priavteChannel];
}
