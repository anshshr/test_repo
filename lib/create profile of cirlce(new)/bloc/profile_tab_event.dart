
abstract class ProfileTabEvent {}

class TabSelected extends ProfileTabEvent {
  final int index;

  TabSelected(this.index);
}