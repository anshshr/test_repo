// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'tags_event.dart';
// part 'tags_state.dart';

// class TagsBloc extends Bloc<TagsEvent, TagsState> {
//   TagsBloc() : super(const TagsInitial([]));

//   Stream<TagsState> mapEventToState(TagsEvent event) async* {
//     if (event is AddTag) {
//       final List<String> updatedTags = List.from(state.tags)..add(event.tag);
//       yield TagsInitial(updatedTags);
//     }
//   }
// }