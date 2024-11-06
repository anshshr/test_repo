import 'package:bloc/bloc.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/textfield_toggle/textfield_toggle_event.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/textfield_toggle/textfield_toggle_state.dart';

class TextFieldToggleBloc
    extends Bloc<TextFieldToggleEvent, TextFieldToggleState> {
  TextFieldToggleBloc() : super(TextFieldHiddenState()) {
    on<ToggleTextFieldEvent>((event, emit) {
      if (state is TextFieldHiddenState) {
        emit(TextFieldVisibleState());
      } else {
        emit(TextFieldHiddenState());
      }
    });
  }
}
