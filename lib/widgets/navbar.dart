

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/drawerprovider.dart';

import '../utils/constants.dart';

class Navbar extends StatefulWidget {
  final Color backgroundColor;
  final Color navbuttonColor;
  final Color MenuIconColor;
  final double radius;
  final Function(int) onNavItemTap;  // New callback for nav item tap

  const Navbar({
    super.key,
    required this.MenuIconColor,
    required this.backgroundColor,
    required this.navbuttonColor,
    required this.radius,
    required this.onNavItemTap,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout(
      mobile: mobileNavBar(
        background:  widget.backgroundColor,MenuIconColor:  widget.MenuIconColor,   ),
      desktop: DesktopNavBar(widget.backgroundColor, widget.radius),
      tablet: TabletNavbar(background:  widget.backgroundColor,MenuIconColor:  widget.MenuIconColor,)
    );
  }

  Widget DesktopNavBar(Color background, double radius) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.only(left: w! / (w! / 30), right: w! / (w! / 30), bottom: 0),
      height: 85,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navLogo(w! / 3, w! / 22),
          Padding(
            padding: EdgeInsets.only(right: w!*0.001, top: 22),
            child: Row(
              children: [
                // Passing index for each nav item
                NavButton(text: 'Home', color: widget.navbuttonColor, width: 60, onTap: () => widget.onNavItemTap(0)),
                NavButton(text: 'About', color: widget.navbuttonColor, width: 70, onTap: () => widget.onNavItemTap(3)),
                NavButton(text: 'Services', color: widget.navbuttonColor, width: 90, onTap: () => widget.onNavItemTap(1)),
                NavButton(text: 'Contact Us', color: widget.navbuttonColor, width: 110, onTap: () => widget.onNavItemTap(4)),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

class TabletNavbar extends StatefulWidget {
  final Color background;
  final Color MenuIconColor;
  const TabletNavbar({super.key,
    required this.background, required this.MenuIconColor
  });

  @override
  State<TabletNavbar> createState() => _TabletNavbarState();
}

class _TabletNavbarState extends State<TabletNavbar> {
  bool iconChanger = false;
  bool isVisible = false;

  void toggleMenuIcon() {
    setState(() {
      iconChanger = !iconChanger;
    });
  }
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          decoration: BoxDecoration(
            color: widget.background,
            border: const Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  drawerProvider.toggleDrawer();
                  // toggleMenuIcon();
                },
                child: Icon(Icons.menu,
                    color: widget.MenuIconColor, size: 35),
              ),
              navLogo(screenWidth / 2.1, screenWidth / 15),
            ],
          ),
        ),

      ],
    );
  }
}




  //###############MOBILE NAVBAR############
class mobileNavBar extends StatefulWidget {
  final Color background;
  final Color MenuIconColor;

  const mobileNavBar({super.key,

    required this.background, required this.MenuIconColor});

  @override
  State<mobileNavBar> createState() => _mobileNavBarState();
}

class _mobileNavBarState extends State<mobileNavBar> {
  bool iconChanger = false;
  bool isVisible = false;

  void toggleMenuIcon() {
    setState(() {
      iconChanger = !iconChanger;
    });
  }

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          decoration: BoxDecoration(
            color: widget.background,
            border: const Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  drawerProvider.toggleDrawer();
                  // toggleMenuIcon();
                },
                child: Icon( Icons.menu,
                    color: widget.MenuIconColor, size: 35),
              ),
              navLogo(screenWidth / 2.1, screenWidth / 15),
            ],
          ),
        ),

      ],
    );
  }}

  Widget navLogo(double width, double fontSize) {
    return Container(
      width: width,
      child: Text(
        "Burlingtoncab",
        style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }


class NavButton extends StatefulWidget {
  final String text;
  final Color color;
  final double width;
  final VoidCallback onTap;
  const NavButton({super.key,
    required this.text,
    required this.color,
    required this.width,
    required this.onTap,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return InkWell(
      onTap: widget.onTap,  // Trigger onTap when clicked
      child: MouseRegion(
        onEnter: (e){
          setState(() {
            isHovered = true;
          });
        },
        onExit: (e){
          setState(() {
            isHovered = false;
          });
        },
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: isHovered? AppColors.borderColor: widget.color,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: 3,
                width: isHovered? widget.width : 0,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





