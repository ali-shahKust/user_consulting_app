
import 'package:designsaeed/Profile.dart';
import 'package:designsaeed/homepage/HomePage.dart';
import 'package:designsaeed/homepage/enterpriseAndPerson.dart';
import 'package:designsaeed/homepage/messaging.dart';
import 'package:designsaeed/tabbar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/models/persisten-bottom-nav-item.widget.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-bottom-nav-bar-styles.widget.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-nav-bar-scaffold.widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class Bottomnav extends StatefulWidget {
  Bottomnav({Key key}) : super(key: key);

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      ChatScreen(),
      Profile()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColor: Color(0xFF8E7EF0),
        inactiveColor: Colors.black,
        activeContentColor: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.mail),
        title: ("Chat"),
        activeColor:Color(0xFF8E7EF0),
        inactiveColor: Colors.black,
        activeContentColor: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.perm_identity),
        title: ("Profile"),
       activeColor: Color(0xFF8E7EF0),
        inactiveColor: Colors.black,
        activeContentColor: Colors.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      onItemSelected: (int) {
        setState(() {}); // This is required to update the nav bar if Android back button is pressed
      },
      customWidget: CustomNavBarWidget(
        items: _navBarsItems(),
        onItemSelected: (index) {
          setState(() {
            _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
          });
        },
        selectedIndex: _controller.index,
      ),
      itemCount: 3,
      navBarStyle: NavBarStyle.custom, // Choose the nav bar style with this property
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget(
      {Key key,
        this.selectedIndex,
        @required this.items,
        this.onItemSelected,});

  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeContentColor == null
                      ? item.activeColor
                      : item.activeContentColor)
                      : item.inactiveColor == null
                      ? item.activeColor
                      : item.inactiveColor),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                    item.title,
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeContentColor == null
                            ? item.activeColor
                            : item.activeContentColor)
                            : item.inactiveColor,
                        fontWeight: FontWeight.w400,
                        fontSize: item.titleFontSize),
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(
                    item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
