import 'package:bloc/bloc.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/upload_visibility/upload_visibility_event.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/upload_visibility/upload_visibility_state.dart';

class UploadVisibilityBloc
    extends Bloc<UploadVisibilityEvent, UploadVisibilityState> {
  UploadVisibilityBloc() : super(ScrollViewHiddenState()) {
    on<ToggleScrollViewEvent>((event, emit) {
      if (state is ScrollViewHiddenState) {
        emit(ScrollViewVisibleState());
      } else {
        emit(ScrollViewHiddenState());
      }
    });
  }
}
