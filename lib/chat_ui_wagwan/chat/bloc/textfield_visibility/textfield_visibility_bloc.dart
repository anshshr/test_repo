import 'package:bloc/bloc.dart';
import 'package:wagwan/modules/chat/bloc/textfield_visibility/textfield_visibility_event.dart';
import 'package:wagwan/modules/chat/bloc/textfield_visibility/textfield_visibility_state.dart';

class TextfieldVisibilityBloc
    extends Bloc<TextfieldVisibilityEvent, TextfieldVisibilityState> {
  TextfieldVisibilityBloc() : super(TextFieldDisappear()) {
    on<TextFieldExpanded>((event, emit) {
      if (state is TextFieldDisappear) {
        emit(TextFieldAppear());
      } else {
        emit(TextFieldDisappear());
      }
    });
  }
}
