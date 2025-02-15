import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/pages/containers/container1.dart';
import 'package:web_app/pages/containers/container2.dart';
import 'package:web_app/pages/containers/container3.dart';
import 'package:web_app/pages/containers/container4.dart';
import 'package:web_app/pages/containers/container5.dart';
import 'package:web_app/pages/containers/container6.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/widgets/bottom.dart';
import 'package:web_app/widgets/navbar.dart';
import '../utils/constants.dart';
import '../utils/drawerprovider.dart';
import '../utils/navigationprovider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  bool isSticky = false;

  // Define global keys for each container
  final GlobalKey container1Key = GlobalKey();
  final GlobalKey container2Key = GlobalKey();
  final GlobalKey container3Key = GlobalKey();
  final GlobalKey container4Key = GlobalKey();
  final GlobalKey container5Key = GlobalKey();
  final GlobalKey container6Key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
        isSticky = _scrollPosition >= 100;
      });
    });
  }

  void scrollToContainer(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final selectedIndex = navigationProvider.selectedIndex;
    final drawerprovider = Provider.of<DrawerProvider>(context);
    w = MediaQuery
        .of(context)
        .size
        .width;
    h = MediaQuery
        .of(context)
        .size
        .height;
    final containerKeys = [
      container1Key,
      container2Key,
      container3Key,
      container4Key,
      container5Key,
      container6Key,
    ];

    return Scaffold(
      body: Stack(
        children: [
         SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
              Container(key: container1Key,
              child: const Container1()),
              Container(width: w, height: 3, color: AppColors.borderColor),
              Container(
                  key: container2Key,
                  child: Container2(
                    onBookNowPressed: () => scrollToContainer(container5Key),
                  )),
              Container(width: w, height: 0.2, color: AppColors.borderColor),
              Container(key: container3Key, child: const Container3()),
              Container(width: w, height: 0.2, color: AppColors.borderColor),
              Container(
                  key: container4Key,
                  child: Container4(
                    onBookNowPressed: () => scrollToContainer(container5Key),
                  )),
              Container(width: w, height: 0.2, color: AppColors.borderColor),
              Container(key: container5Key, child: const Container5()),
              Container(width: w, height: 0.2, color: AppColors.borderColor),
              Container(key: container6Key, child: const Container6()),
              Container(width: w, height: 0.2, color: AppColors.borderColor),
              const Bottom(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              backgroundColor: isSticky ? Colors.white : Colors.transparent,
              navbuttonColor: isSticky ? Colors.black : Colors.white,
              radius: isSticky ? 40 : 0,
              MenuIconColor: isSticky ? Colors.black : Colors.white,
              onNavItemTap: (int index) {
                navigationProvider.navigateToContainer(index);
                scrollToContainer(containerKeys[index]);
              },
            ),
          ),
          if(drawerprovider.isVisible)
            Positioned(
              top: h!*0.1,
                left: w!*0.1,
                child: NavigationDrawer(onNavItemTap: (int index) {
                  drawerprovider.toggleDrawer();
                  navigationProvider.navigateToContainer(index);
                  scrollToContainer(containerKeys[index]);
                },))
        ],
      ),
    );
  }
}
class NavigationDrawer extends StatelessWidget {
  final Function(int) onNavItemTap;
  const NavigationDrawer({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final selectedIndex = navigationProvider.selectedIndex;

    return Container(
      width: w!*0.8,
      height: w!,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            // Darker shadow color for elevation
            spreadRadius: 5,
            // Spread the shadow further to make it more noticeable
            blurRadius: 20,
            // Increase the blur to make it softer and more realistic
            offset: const Offset(
                0, 15), // Larger vertical offset to simulate elevation
          ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:    [
          NavButton(text: 'Home', color: Colors.white, width: 60, onTap: () => onNavItemTap(0)),
          NavButton(text: 'About', color:  Colors.white, width: 70, onTap: () => onNavItemTap(3)),
          NavButton(text: 'Services', color:  Colors.white, width: 90, onTap: () => onNavItemTap(1)),
          NavButton(text: 'Contact Us', color:  Colors.white, width: 110, onTap: () => onNavItemTap(4)),
        ],
      ),
    );
  }
}
