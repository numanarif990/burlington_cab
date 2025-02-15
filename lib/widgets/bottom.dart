
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/constants.dart';
class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const MobileBottom(),
      desktop: const DesktopBottom(),
    );
  }
}

class MobileBottom extends StatelessWidget {
  const MobileBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.12,
        // minHeight: MediaQuery.of(context).size.height * 0.1,
      ),
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                navLogo(width: w! * 0.3, fontSize: w! * 0.04),
                SizedBox(
                  width: w! * 0.008,
                ),
                Container(
                  width: w!,
                  constraints: const BoxConstraints(
                    maxHeight: 1,
                  ),
                  color: Colors.grey,
                ),
                SizedBox(
                  width: w! * 0.008,
                ),
                Text(
                  "Copyright © 2024 burlingtoncitycab.ca",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: w! * 0.03,
                  ),
                )
              ],
            ),
            SizedBox(
              height: w! * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BottomIcon(
                  url: 'https://www.instagram.com/burlingtoncitycab1/',

                  color: Color(0xffFD07B0), icon: FontAwesomeIcons.instagram,),
                SizedBox(
                  width: w! * 0.005,
                ),
                const BottomIcon(
                  url: 'https://www.facebook.com/burlingtoncitycab/',

                  color: Color(0xff0866FF), icon: FontAwesomeIcons.facebook,),
                SizedBox(
                  width: w! * 0.005,
                ),
                const BottomIcon(
                  url: 'https://www.youtube.com/@burlington_citycab',

                  color: Color(0xffFF0033), icon: FontAwesomeIcons.youtube,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DesktopBottom extends StatelessWidget {
  const DesktopBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.1,
        // minHeight: MediaQuery.of(context).size.height * 0.1,
      ),
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                navLogo(width: w! * 0.1, fontSize: w! * 0.015),
                SizedBox(
                  width: w! * 0.01,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 1,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.1,
                  ),
                  color: Colors.grey,
                ),
                SizedBox(
                  width: w! * 0.01,
                ),
                Text(
                  "Copyright © 2024 burlingtoncitycab.ca",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: w! * 0.015,
                  ),
                )
              ],
            ),
             Row(
              children: [
                const BottomIcon(
                  url: 'https://www.instagram.com/burlingtoncitycab1/',
                  color: Color(0xffFD07B0), icon: FontAwesomeIcons.instagram,),
                SizedBox(
                  width: w! * 0.005,
                ),
                const BottomIcon(
                  url: 'https://www.facebook.com/burlingtoncitycab/',
                  color: Color(0xff0866FF), icon: FontAwesomeIcons.facebook,),
                SizedBox(
                  width: w! * 0.005,
                ),
                const BottomIcon(
                  url: 'https://www.youtube.com/@burlington_citycab',
                  color: Color(0xffFF0033), icon: FontAwesomeIcons.youtube,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class navLogo extends StatelessWidget {
  final double width;
  final double fontSize;

  const navLogo({super.key, required this.width, required this.fontSize});

  @override
  Widget build(BuildContext context) {
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
}


class BottomIcon extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String url;
  const BottomIcon({super.key,
    required this.url,
    required this.color, required this.icon});

  @override
  State<BottomIcon> createState() => _BottomIconState();
}

class _BottomIconState extends State<BottomIcon> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  bool onIt = false;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        _launchURL(widget.url);
        onIt=!onIt;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (e){
          setState(() {
            onIt = true;
          });
        },
        onExit: (e){
          setState(() {
            onIt = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: onIt? widget.color: Colors.white,
          ),
          child: Center(
            child: Icon(widget.icon, color: onIt? Colors.white: widget.color,size: 20,),
          ),
        ),
      ),
    );
  }
}
