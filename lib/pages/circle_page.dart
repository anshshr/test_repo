import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/pages/explore_circle.dart';
import 'package:wagwan_work_testing/pages/find_friends.dart';

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Find Circles'),
            Tab(text: 'Find Friends'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CirclesSection(),
          FriendsSection(),
        ],
      ),
    );
  }
}