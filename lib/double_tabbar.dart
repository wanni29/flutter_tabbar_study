import 'package:flutter/material.dart';
import 'package:practice_tab_app/components/my_tab_icons.dart';

class DoubleTabbar extends StatefulWidget {
  const DoubleTabbar({Key? key}) : super(key: key);

  @override
  State<DoubleTabbar> createState() => _DoubleTabbarState();
}

class _DoubleTabbarState extends State<DoubleTabbar>
    with TickerProviderStateMixin {
  int tabNumber = 1;
  late TabController _tabController1;
  late TabController _tabController2;

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(length: 3, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter TabBar Example ${tabNumber}"),
      ),
      body: Column(
        children: [
          _tabbar1(),
          _tabbar2(),
          Expanded(
            child: Stack(
              children: [
                if (tabNumber == 1) _view1(),
                if (tabNumber == 2) _view2(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tabbar1() {
    return TabBar(
      labelColor: Colors.blue,
      onTap: (v) {
        setState(() {
          tabNumber = 1;
        });
      },
      controller: _tabController1,
      tabs: [
        MyTabIcons(icon: Icons.home, textContext: "Home"),
        MyTabIcons(icon: Icons.favorite, textContext: "Favorites"),
        MyTabIcons(icon: Icons.settings, textContext: "Settings"),
      ],
    );
  }

  Widget _tabbar2() {
    return TabBar(
      labelColor: Colors.redAccent,
      onTap: (v) {
        setState(() {
          tabNumber = 2;
        });
      },
      controller: _tabController2,
      tabs: [
        Tab(icon: Icon(Icons.home), text: "Home"),
        Tab(icon: Icon(Icons.favorite), text: "Favorites"),
        Tab(icon: Icon(Icons.settings), text: "Settings"),
      ],
    );
  }

  Widget _view1() {
    return TabBarView(
      controller: _tabController1,
      children: [
        Center(child: Text("Home")),
        Center(child: Text("Favoriate")),
        Center(child: Text("Settings")),
      ],
    );
  }

  Widget _view2() {
    return TabBarView(
      controller: _tabController2,
      children: [
        Center(child: Text("Home")),
        Center(child: Text("Favoriate")),
        Center(child: Text("Settings")),
      ],
    );
  }
}
