import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/pages/containers/container2.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class Container3 extends StatefulWidget {
  const Container3({super.key});

  @override
  State<Container3> createState() => _Container3State();
}

class _Container3State extends State<Container3> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const MobileContainer3(),
      desktop: const DeskTopContainer3(),
    );
  }
}

class MobileContainer3 extends StatelessWidget {
  const MobileContainer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width* 1.0,
        minHeight: MediaQuery.of(context).size.width* 1.0,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          const titlebox(title: "Why Us?"),
          const DescriptionBox(description: "Your Ultimate Booking experience starts with us!",),
          AnimatedContainer(
            duration: const Duration(milliseconds: 375),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(
                        0, 15), // Larger vertical offset to simulate elevation
                  )
                ]
            ),
            child: Column(
              children: [
                Specification(
                  topleft: 20,
                  topright: 20,
                  bottomleft: 0,
                  bottomright: 0,
                  containerheight: w!*0.15,
                  containerwidth: w!*0.9,
                  titlefontsize: w!*0.03,
                  descriptionfontsize: w!*0.021,
                  title: "Best price guaranteed",
                  description: "We’ll give you 100% back of the difference, guaranteed!",
                  icon: Icons.monetization_on,
                ),
                Specification(
                  topleft: 0,
                  topright: 0,
                  bottomleft: 0,
                  bottomright: 0,
                  containerheight: w!*0.15,
                  containerwidth: w!*0.9,
                  titlefontsize: w!*0.03,
                  descriptionfontsize: w!*0.021,
                  title: "Experience driver",
                  description: "We have a team of highly skilled and experienced drivers.",
                  icon: Icons.person,
                ),
                Specification(
                  topleft: 0,
                  topright: 0,
                  bottomleft: 0,
                  bottomright: 0,
                  containerheight: w!*0.15,
                  containerwidth: w!*0.9,
                  titlefontsize: w!*0.03,
                  descriptionfontsize: w!*0.021,
                  title: "24/7 services",
                  description: "Reserve your car anytime, and we'll bring it right to you!",
                  icon: Icons.lock_clock_sharp,
                ),
                Specification(
                  topleft: 0,
                  topright: 0,
                  bottomleft: 20,
                  bottomright: 20,
                  containerheight: w!*0.15,
                  containerwidth: w!*0.9,
                  titlefontsize: w!*0.03,
                  descriptionfontsize: w!*0.021,
                  title: "24/7 technical support",
                  description: "Reach out to support anytime for quick assistance with any issue!",
                  icon: Icons.message,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DeskTopContainer3 extends StatelessWidget {
  const DeskTopContainer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height* 0.75,
        minHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          const titlebox(title: "Why Us?"),
          const DescriptionBox(description: "Your Ultimate Booking experience starts with us!",),
          AnimatedContainer(
            duration: const Duration(milliseconds: 375),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(
                        0, 15), // Larger vertical offset to simulate elevation
                  )
                ]
                ),
            child: Column(
              children: [
                Specification(
                  topleft: 20,
                  topright: 20,
                  bottomleft: 0,
                  bottomright: 0,
                  containerheight: w!*0.05,
                  containerwidth: w!*0.5,
                  titlefontsize: w!*0.011,
                  descriptionfontsize: w!*0.009,
                  title: "Best price guaranteed",
                  description: "Found a lower price? We’ll give you 100% back of the difference, guaranteed!",
                  icon: Icons.monetization_on,
                ),
                Specification(
                  topleft: 0,
                  topright: 0,
                  bottomleft: 0,
                  bottomright: 0,
                  containerheight: w!*0.05,
                  containerwidth: w!*0.5,
                  titlefontsize: w!*0.011,
                  descriptionfontsize: w!*0.009,
                  title: "Experience driver",
                  description: "We have a team of highly skilled and experienced drivers ready to serve you with excellence.",
                  icon: Icons.person,
                ),
                Specification(
                  topleft: 0,
                  topright: 0,
                  bottomleft: 0,
                  bottomright: 0,
                  containerheight: w!*0.05,
                  containerwidth: w!*0.5,
                  titlefontsize: w!*0.011,
                  descriptionfontsize: w!*0.009,
                  title: "24/7 services",
                  description: "Reserve your car anytime, and we'll bring it right to your door—fast, easy, and hassle-free!",
                  icon: Icons.lock_clock_sharp,
                ),
                Specification(
                  topleft: 0,
                  topright: 0,
                  bottomleft: 20,
                  bottomright: 20,
                  containerheight: w!*0.05,
                  containerwidth: w!*0.5,
                  titlefontsize: w!*0.011,
                  descriptionfontsize: w!*0.009,
                  title: "24/7 technical support",
                  description: "Need help? Reach out to support anytime for quick assistance with any issue!",
                  icon: Icons.message,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  final String description;
  const DescriptionBox({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        description,
        style: TextStyle(
            fontSize: w! * 0.03,
            fontWeight: FontWeight.normal,
            color: Colors.white),
      ),
    );
  }
}

class Specification extends StatefulWidget {
  final double topleft;
  final double topright;
  final double bottomleft;
  final double bottomright;
  final String title;
  final String description;
  final IconData icon;
  final double containerwidth;
  final double containerheight;
  final double titlefontsize;
  final double descriptionfontsize;

  const Specification(
      {super.key,
      required this.topleft,
      required this.bottomleft,
      required this.bottomright,
      required this.topright,
      required this.title,
        required this.description,
        required this.icon,
        required this.titlefontsize,
        required this.containerwidth,
        required this.containerheight,
        required this.descriptionfontsize

      });

  @override
  State<Specification> createState() => _SpecificationState();
}

class _SpecificationState extends State<Specification> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (e){
        setState(() {
          isHover = true;
        });
      },
      onLongPressEnd: (e){
        setState(() {
          isHover = false;
        });
      },
      child: MouseRegion(
        onEnter: (e) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (e) {
          setState(() {
            isHover = false;
          });
        },
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          padding: EdgeInsets.all(8),
          width: isHover ? widget.containerwidth*1.03 : widget.containerwidth,
          height: isHover ? widget.containerheight*1.08 : widget.containerheight,
          duration: const Duration(
            milliseconds: 375,
          ),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: isHover
                ? BorderRadius.circular(20)
                : BorderRadius.only(
                    topLeft: Radius.circular(widget.topleft),
                    topRight: Radius.circular(widget.topright),
                    bottomLeft: Radius.circular(widget.bottomleft),
                    bottomRight: Radius.circular(widget.bottomright),
                  ),
            boxShadow: [
              isHover
                  ? BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(
                          0, 15), // Larger vertical offset to simulate elevation
                    )
                  : const BoxShadow()
            ],
          ),
          child: Row(
            children: [
              Iconsetter(isHover: isHover, icon: widget.icon),
              SizedBox(
                width: w!/(w!/20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isHover ?  widget.titlefontsize*1.1: widget.titlefontsize, // The animated font size
                      color: AppColors.primaryColor,
                    ),
                    duration: const Duration(milliseconds: 300),
                    // Duration of the animation
                    child:  Text(widget.title),
                  ),
                  AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: isHover ? widget.descriptionfontsize*1.1 : widget.descriptionfontsize, // The animated font size
                      color: Colors.white,
                    ),
                    duration: const Duration(milliseconds: 300),
                    // Duration of the animation
                    child:  Text(
                        widget.description),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Iconsetter extends StatefulWidget {
  final bool isHover;
  final IconData icon;

  const Iconsetter({super.key, required this.isHover, required this.icon});

  @override
  State<Iconsetter> createState() => _IconState();
}

class _IconState extends State<Iconsetter> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 375),
      curve: Curves.easeOut,
      width: widget.isHover ? w!/(w!/50) : w!/(w!/40),
      height: widget.isHover ?  h!/(h!/50) :  h!/(h!/40),
      decoration: BoxDecoration(
        borderRadius: widget.isHover
            ? BorderRadius.circular(10)
            : BorderRadius.circular(5),
        color: widget.isHover
            ? const Color(0xff1572D3).withOpacity(0.2)
            : const Color(0xff1572D3).withOpacity(0.1),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 375),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: Icon(
            widget.icon,
            key: ValueKey<bool>(widget.isHover),
            // Helps AnimatedSwitcher differentiate the states
            color: AppColors.primaryColor,
            size: widget.isHover ? 32 : 25,
          ),
        ),
      ),
    );
  }
}
