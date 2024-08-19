part of 'public_private_bloc.dart';

sealed class PublicPrivateEvent extends Equatable {
  const PublicPrivateEvent();

  @override
  List<Object> get props => [];
}



class isPublicSelected extends PublicPrivateEvent{
  
}
class isPrivateSelected extends PublicPrivateEvent{

}