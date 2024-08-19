import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wagwan/modules/profile/pages/edit_profile_details.dart';
import 'package:wagwan/modules/profile/pages/profile_details.dart';
import 'package:wagwan_work_testing/circle%20profile/profile/pages/profile_details.dart';

class ProfileTab extends StatefulWidget {
  final StatefulNavigationShell statefulNavigationShell;
  final List<Widget> children;

  const ProfileTab({
    super.key,
    required this.statefulNavigationShell,
    required this.children,
  });

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: widget.children.length,
    vsync: this,
    initialIndex: widget.statefulNavigationShell.currentIndex,
  );
  final controller = TextEditingController();

  @override
  void didUpdateWidget(covariant ProfileTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.statefulNavigationShell.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 150,
        title: Column(
          children: [
            const Text(
              'Profile',
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return EditProfileDetails(controller: controller);
                  },
                );
              },
              child:  ProfileDetails(),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: const [
            Tab(text: "Friends"),
            Tab(text: "Media"),
            Tab(text: "Requests"),
            Tab(text: "Saved"),
            Tab(text: "Settings"),
          ],
          onTap: (index) {
            widget.statefulNavigationShell.goBranch(index,
                initialLocation:
                    index == widget.statefulNavigationShell.currentIndex);
          },
        ),
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // TODO : Change this later
        controller: _tabController,
        children: widget.children,
      ),
    );
  }
}
