
abstract class ProfileTabState {}

class TabState extends ProfileTabState {
  final int selectedIndex;

  TabState(this.selectedIndex);
}