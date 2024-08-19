
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'public_private_event.dart';
part 'public_private_state.dart';

class PublicPrivateBloc extends Bloc<PublicPrivateEvent, PublicPrivateState> {
  PublicPrivateBloc() : super(PublicPrivateInitial()) {
    on<isPublicSelected>(select_public);
    on<isPrivateSelected>(select_private);
  }

  void select_public(isPublicSelected event, Emitter<PublicPrivateState> emit) {
    emit(PublicPrivateInitial(isPublic: true,isPrivate: false));
  }

 void select_private(isPrivateSelected event, Emitter<PublicPrivateState> emit) {
  emit(PublicPrivateInitial(isPrivate: true,isPublic: false));
  }
}
