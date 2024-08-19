part of 'public_private_bloc.dart';

sealed class PublicPrivateState extends Equatable {
  const PublicPrivateState();

  @override
  List<Object> get props => [];
}

final class PublicPrivateInitial extends PublicPrivateState {
  bool isPublic;
  bool isPrivate;

  PublicPrivateInitial({this.isPrivate = false, this.isPublic = false});
   @override
  List<Object> get props => [isPublic,isPrivate];
}
