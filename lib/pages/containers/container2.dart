import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:web_app/utils/colors.dart';

import '../../utils/constants.dart';


class Container2 extends StatefulWidget {
  final VoidCallback onBookNowPressed;
  const Container2({super.key, required this.onBookNowPressed});

  @override
  State<Container2> createState() => _Container2State();
}

class _Container2State extends State<Container2> {
  final List<String> _cardImages = [
    'assets/images/car2.jpg',
    'assets/images/van.jpg',
    'assets/images/wheelcar.jpg',
  ];
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _preloadImages();
  }
  void _preloadImages() {
    for (String imagePath in _cardImages) {
      precacheImage(AssetImage(imagePath), context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer2(onBookNowPressed: widget.onBookNowPressed),
      desktop: DeskTopContainer2(onBookNowPressed: widget.onBookNowPressed),
      tablet: TabletContainer2(onBookNowPressed: widget.onBookNowPressed),
    );
  }
}

class MobileContainer2 extends StatelessWidget {

  final VoidCallback onBookNowPressed;
  const MobileContainer2({super.key, required this.onBookNowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width * 4.2,
        minHeight: MediaQuery.of(context).size.width *3.8,
      ),
      color: AppColors.backgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const titlebox(title: "Our Services"),
           Positioned(
             top: w!*0.46,
             bottom: w!*0.1,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children: [
                 HoverCardMobile(
                   image: "assets/images/car2.jpg",
                   title: "CAR",
                   onBookNowPressed: onBookNowPressed,
                   description: "Spacious 5-seater sedan with\nergonomic seating, modern tech,\nand reliability. Ideal for family\nor business trips.",
                 ),
                 HoverCardMobile(
                   image: "assets/images/van.jpg",
                   title: "VAN",
                   onBookNowPressed: onBookNowPressed,
                   description: "Spacious, safe, and eco-friendly\nfamily van with entertainment,\ncomfort, and convenient\nfeatures for travel",
                 ),
                 HoverCardMobile(
                   image: "assets/images/wheelcar.jpg",
                   title: "WHEELCHAIR VAN",
                   onBookNowPressed: onBookNowPressed,
                   description: "Spacious van equipped with\na ramp, secure wheelchair\ntie-downs, and comfortable\nseating for everyone.",
                 )
               ],
             ),
           )
        ],
      ),
    );
  }
}

class TabletContainer2 extends StatelessWidget {

  final VoidCallback onBookNowPressed;
  const TabletContainer2({super.key,
    required this.onBookNowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 1.5,
        minHeight: MediaQuery.of(context).size.height *1.4,
      ),
      color: AppColors.backgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const titlebox(title: "Our Services"),
          Positioned(
            top: w!*0.24,
            bottom: w!*0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                HoverCardMobile(
                  image: "assets/images/car2.jpg",
                  title: "CAR",
                  onBookNowPressed: onBookNowPressed,
                  description: "Spacious 5-seater sedan with\nergonomic seating, modern tech,\nand reliability. Ideal for family\nor business trips.",
                ),
                HoverCardMobile(
                  image: "assets/images/van.jpg",
                  title: "VAN",
                  onBookNowPressed: onBookNowPressed,
                  description: "Spacious, safe, and eco-friendly\nfamily van with entertainment,\ncomfort, and convenient\nfeatures for travel",
                ),
                HoverCardMobile(
                  image: "assets/images/wheelcar.jpg",
                  title: "WHEELCHAIR VAN",
                  onBookNowPressed: onBookNowPressed,
                  description: "Spacious van equipped with\na ramp, secure wheelchair\ntie-downs, and comfortable\nseating for everyone.",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class DeskTopContainer2 extends StatelessWidget {
  final VoidCallback onBookNowPressed;
  const DeskTopContainer2({super.key, required this.onBookNowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      color: AppColors.backgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const titlebox(title: "Our Services"),
          Positioned(
            bottom: h! * 0.05,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HoverCard(
                  image: "assets/images/car2.jpg",
                  title: "CAR",
                  onBookNowPressed: onBookNowPressed,
                  description: "Spacious 5-seater sedan with\nergonomic seating, modern tech,\nand reliability. Ideal for family\nor business trips.",
                ),
                HoverCard(
                  image: "assets/images/van.jpg",
                  title: "VAN",
                  onBookNowPressed: onBookNowPressed,
                  description: "Spacious, safe, and eco-friendly\nfamily van with entertainment,\ncomfort, and convenient\nfeatures for travel",
                ),
                HoverCard(
                  image: "assets/images/wheelcar.jpg",
                  title: "WHEELCHAIR VAN",
                  onBookNowPressed: onBookNowPressed,
                  description: "Spacious van equipped with\na ramp, secure wheelchair\ntie-downs, and comfortable\nseating for everyone.",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onBookNowPressed;
  const HoverCard({super.key,
    required this.onBookNowPressed,
    required this.image, required this.title, required this.description});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHover = false;

  late ScrollController _scrollController;
  final GlobalKey contactuskey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  void scrollToContainer(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }



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
        cursor: SystemMouseCursors.click,
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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              height: isHover ? h! / (h! / 300) : h! / (h! / 280),
              width: w! / (w! / 250),
              decoration: BoxDecoration(
                // border: Border.all(color: AppColors.primaryColor,width: 3),
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(20),
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
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              top: isHover ? -100 : 0,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.easeOut,
                  height: isHover ? h! / (h! / 390) : h! / (h! / 280),
                  width: w! / (w! / 250),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: AnimatedContainer(
                          clipBehavior: Clip.none,
                          duration: const Duration(milliseconds: 375),
                          curve: Curves.easeOut,
                          height: isHover ? h! / (h! / 180) : h! / (h! / 220),
                          width: isHover ? w! / (w! / 180) : w! / (w! / 220),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(widget.image))),
                        ),
                      ),
                      // const SizedBox(height: 3,),
                       Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: AppColors.primaryColor),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                 Text(
                                  widget.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 4, // Set initial elevation to 0
                                    shadowColor: Colors.grey, // Set shadow color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20), // Adjust border radius as needed
                                    ),
                                  ),
                                  onPressed: widget.onBookNowPressed,
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}


class titlebox extends StatelessWidget {
  final String title;
  const titlebox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.topCenter,
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(
                0, 15), // Larger vertical offset to simulate elevation
          ),
        ],
        color: const Color(0xff1572D3).withOpacity(0.1),
      ),
      child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 16),
          )),
    );
  }
}

class HoverCardMobile extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onBookNowPressed;
  const HoverCardMobile({super.key,
    required this.onBookNowPressed,
    required this.image, required this.title, required this.description});

  @override
  State<HoverCardMobile> createState() => _HoverCardMobileState();
}

class _HoverCardMobileState extends State<HoverCardMobile> {
  bool isHover = true;

  late ScrollController _scrollController;
  final GlobalKey contactuskey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  void scrollToContainer(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 375),
          curve: Curves.easeOut,
          height: isHover ? h! / (h! / 300) : h! / (h! / 280),
          width: w! / (w! / 250),
          decoration: BoxDecoration(
            // border: Border.all(color: AppColors.primaryColor,width: 3),
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(20),
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
            ],
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 375),
          curve: Curves.easeOut,
          top: isHover ? -100 : 0,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              height: isHover ? h! / (h! / 390) : h! / (h! / 280),
              width: w! / (w! / 250),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: AnimatedContainer(
                      clipBehavior: Clip.none,
                      duration: const Duration(milliseconds: 375),
                      curve: Curves.easeOut,
                      height: isHover ? h! / (h! / 180) : h! / (h! / 220),
                      width: isHover ? w! / (w! / 180) : w! / (w! / 220),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                              image: AssetImage(widget.image))),
                    ),
                  ),
                  // const SizedBox(height: 3,),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: AppColors.primaryColor),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              widget.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 4, // Set initial elevation to 0
                                shadowColor: Colors.grey, // Set shadow color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Adjust border radius as needed
                                ),
                              ),
                              onPressed: widget.onBookNowPressed,
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
