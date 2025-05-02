
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'apps_container/download_badge.dart';


class Container1 extends StatefulWidget {
  const Container1({super.key});

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  final List<String> _backgroundImages = [
    'assets/images/placeholderone.jpg',
    'assets/images/placeholder1.jpg',
    'assets/images/placeholder2.jpg',
    'assets/images/placeholder3.jpg',
    'assets/images/placeholder4.jpg',
  ];
   bool loaded = false;

  late final CarouselSliderController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CarouselSliderController();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _preloadImages();
  }
  void _preloadImages() {
    for (String imagePath in _backgroundImages) {
      precacheImage(AssetImage(imagePath), context);
    }
  }



  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout(
      desktop: deskTopContainer1(),
      mobile: mobileContainer1(),
    );
  }

  //--------------Desktop--------------
  Widget deskTopContainer1() {

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        CarouselSlider(
          items: _backgroundImages.map((imagePath) {
            return Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: screenHeight,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOut,
            scrollDirection: Axis.horizontal,
            enableInfiniteScroll: true,
          ),
          carouselController: _controller,
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
          ),
        ),
        Positioned(
          top: screenWidth / 6,
          left: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    fontsize: screenWidth * 0.07,
                    text: "Get there quicker",
                  ),
                  Row(
                    children: [
                      MainText(fontsize: screenWidth * 0.07, text: "Book with "),
                      AnimatedText(fontsize: screenWidth * 0.07, width: screenWidth / 2),
                    ],
                  )
                ],
              ),
              AnimatedText2(fontsize: screenWidth / 60),

            ],
          ),
        ),
        // PopUpIcons Positioned at Bottom Right
        const Positioned(
          bottom: -25, // Add some padding to make it responsive
          right: 20,  // Add some padding for better placement
          child: Row(
            children: [
              PopUpIcons(
                color: Color(0xffFD07B0),
                icon: FontAwesomeIcons.instagram,
                title: "Instagram",
                url: 'https://www.instagram.com/burlingtoncitycab1/',
              ),
              PopUpIcons(
                color: Color(0xff0866FF),
                icon: FontAwesomeIcons.facebook,
                title: "Facebook",
                url: 'https://www.facebook.com/burlingtoncitycab/',
              ),
              PopUpIcons(
                color: Color(0xffFF0033),
                icon: FontAwesomeIcons.youtube,
                title: "Youtube",
                url: 'https://www.youtube.com/@burlington_citycab',
              ),
            ],
          ),
        ),
       Positioned(
           bottom: 25, // Add some padding to make it responsive
           left: 20,
           child:  Row(
         children: [
           DownloadBadge(
             imageUrl: 'assets/images/apple-logo.png',
             text: 'App Store',
             height: 70,
             url: 'https://apps.apple.com/us/app/maple-rides/id6743804217',
           ),
           SizedBox(width: 10,),
           DownloadBadge(
             imageUrl: 'assets/images/play.png',
             text: 'Google Play',
             height: 70,
             url: 'https://play.google.com/store/apps/details?id=com.maplerides.passengerapp',
           ),
         ],
       ))
      ],
    );
  }
  //---------------MOBILE----------------
  Widget mobileContainer1() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        CarouselSlider(
          items: _backgroundImages.map((imagePath) {
            return Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: screenHeight,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOut,
            scrollDirection: Axis.horizontal,
            enableInfiniteScroll: true,
          ),
          carouselController: _controller,
        ),
        Positioned(
          top: h! *0.69,
          left: w!*0.05,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    fontsize: w! * 0.09,
                    text: "Get there quicker",
                  ),
                  Row(
                    children: [
                      MainText(fontsize: w! * 0.09, text: "Book with "),
                      AnimatedText(fontsize: w! * 0.09, width: w! / 2),
                    ],
                  )
                ],
              ),
              AnimatedText2(fontsize: w!* 0.03),
            ],
          ),
        ),
        Positioned(
            bottom: 25, // Add some padding to make it responsive
            left: 10,
            child:  Row(
              children: [
                DownloadBadge(
                  imageUrl: 'assets/images/apple-logo.png',
                  text: 'App Store',
                  height: 50,
                  url: 'https://apps.apple.com/us/app/maple-rides/id6743804217',
                ),
                SizedBox(width: 10,),
                DownloadBadge(
                  imageUrl: 'assets/images/play.png',
                  text: 'Google Play',
                  height: 50,
                  url: 'https://play.google.com/store/apps/details?id=com.maplerides.passengerapp',
                ),
              ],
            ))
      ],
    );
  }

}



class AnimatedText extends StatelessWidget {
  final double fontsize;
  final double width;
  const AnimatedText({super.key, required this.fontsize, required this.width});

  @override
  Widget build(BuildContext context) {
      return SizedBox(
       width: width,
       child: DefaultTextStyle(
         style:  Theme.of(context).textTheme.headlineLarge!.copyWith(
           color: AppColors.primaryColor, // Adjust color if needed
           fontSize: fontsize,
           fontWeight: FontWeight.bold,
         ),
         child: AnimatedTextKit(
           repeatForever: true,
           animatedTexts: [
             FadeAnimatedText('US!'),
             FadeAnimatedText('US NOW!!'),

           ],
           onTap: () {
             print("Tap Event");
           },
         ),
       ),
     );

  }
}


class MainText extends StatelessWidget {
  final double fontsize;
 final String text;
  const MainText({super.key, required this.fontsize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.1, // Adjust the line height as needed
      ),
    );
  }
}

class AnimatedText2 extends StatelessWidget {
  final double fontsize;
  const AnimatedText2({super.key, required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: DefaultTextStyle(
        style:  Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Colors.white, // Adjust color if needed
          fontSize: fontsize,
          fontWeight: FontWeight.w500,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText('Reliable taxis, anytime, anywhere you go.'),
            TypewriterAnimatedText('Book taxis anytime, anywhere with ease.'),
            TypewriterAnimatedText('Dependable rides, anytime, any location.'),
            TypewriterAnimatedText('Trusted taxi service, wherever, whenever needed.'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}



class PopUpIcons extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String url;
  const PopUpIcons({super.key,
    required this.url,
    required this.icon, required this.color, required this.title});

  @override
  State<PopUpIcons> createState() => _PopUpIconsState();
}

class _PopUpIconsState extends State<PopUpIcons> {

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
    return Container(
      margin: const EdgeInsets.all(1),
      width: 80,
      height: 120,
      child: Center(
        child: Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: onIt? 1 : 0,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: onIt? const Alignment(0, -1): const Alignment(0, 0),
                child: Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                    left: 35,
                    top: 30,
                    child: Transform(
                      transform: Matrix4.rotationZ(pi / 4),
                      alignment: FractionalOffset.center,
                      child: Container(
                        height: 10,
                        width: 10,
                        color: widget.color,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.color,
                    ),
                    child: Center(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            InkWell(
              onTap: (){
              _launchURL(widget.url);
              },
              child: MouseRegion(
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
                cursor: SystemMouseCursors.click,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: onIt? widget.color: Colors.white,

                    ),
                    child: Center(
                      child: Icon(widget.icon,color: onIt? Colors.white: widget.color,),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



