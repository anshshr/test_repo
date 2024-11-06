import 'package:bloc/bloc.dart';
import 'package:wagwan/modules/chat/bloc/buttons_visibilty/button_visibility_event.dart';
import 'package:wagwan/modules/chat/bloc/buttons_visibilty/button_visibility_state.dart';

class ButtonVisibilityBloc
    extends Bloc<ButtonVisibilityEvent, ButtonVisibilityState> {
  ButtonVisibilityBloc() : super(UploadButtonsDiappearState()) {
    on<ButttonsVisible>((event, emit) {
      if (state is UploadButtonsDiappearState) {
        emit(UploadButtonsAppearState());
      } else {
        emit(UploadButtonsDiappearState());
      }
    });
  }
}
