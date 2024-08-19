import 'package:bloc/bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/color_picker/color_picker_event.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/color_picker/color_picker_state.dart';

class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBloc() : super(ColorInitial()) {
    on<ColorSelected>((event, emit) {
      emit(ColorUpdated(event.selectedColor));
    });

 
  }
}
