import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/pages/containers/container2.dart';
import 'package:web_app/utils/constants.dart';

import '../../utils/colors.dart';

class Container4 extends StatefulWidget {
  final VoidCallback onBookNowPressed;
  const Container4({super.key, required this.onBookNowPressed});

  @override
  State<Container4> createState() => _Container4State();
}

class _Container4State extends State<Container4> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer4(onBookNowPressed: widget.onBookNowPressed),
      desktop: DesktopContainer4(onBookNowPressed: widget.onBookNowPressed),
    );
  }
}

class MobileContainer4 extends StatelessWidget {
  final VoidCallback onBookNowPressed;
  const MobileContainer4({super.key, required this.onBookNowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: w,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width * 1.3,
          minHeight: MediaQuery.of(context).size.width ,
        ),
        color: AppColors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const titlebox(title: "About Us"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Align(
                alignment: Alignment.center, // Centering the Row
                child: aboutdescription(
                  width: w!*0.9,
                  height: w!*1.1,
                  titlefontsize: w!*0.07,
                  descriptionfontsize: w!*0.03,
                  onBookNowPressed: onBookNowPressed,),
              ),
            ),
          ],
        )

    );
  }
}

class DesktopContainer4 extends StatelessWidget {
  final VoidCallback onBookNowPressed;
  const DesktopContainer4({super.key, required this.onBookNowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const titlebox(title: "About Us"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Align(
              alignment: Alignment.center, // Centering the Row
              child: Row(
                mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                children: [
                  const ImageContainer(),
                  const SizedBox(
                    width: 20,
                  ),
                  aboutdescription(
                    width: w! * 0.48,
                    height: h! * 0.80,
                    titlefontsize: w!*0.04,
                    descriptionfontsize: w!*0.011,
                    onBookNowPressed: onBookNowPressed,),
                ],
              ),
            ),
          ),
        ],
      )

    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: w!*0.35,  // Adjusted
      height: h!*0.80, // Adjusted
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 15),
          )
        ],
        color: Colors.white,
        border: Border.all(width: 3, color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: AssetImage('assets/images/about_us.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class aboutdescription extends StatelessWidget {
  final double width;
  final double height;
  final double titlefontsize;
  final double descriptionfontsize;
  final VoidCallback onBookNowPressed;
  const aboutdescription({super.key,
    required this.width,
    required this.height,
    required this.titlefontsize,
    required this.descriptionfontsize,
    required this.onBookNowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "About Us",
            style: TextStyle(
              fontSize:titlefontsize,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          Text(
            "Your Ultimate Cab Booking Experience!",
            style: TextStyle(
              fontSize: titlefontsize*0.5,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "At Burlington City Cab, we believe in transforming the way you travel. Our mission is to deliver safe, reliable, and fast rides at your fingertips, no matter where you are. Whether it’s a daily commute or a late-night ride, we prioritize your comfort, safety, and convenience with cutting-edge technology and trusted drivers. Seamlessly book your cab in seconds, track your ride in real-time, and enjoy an effortless journey to your destination. We’re committed to setting new standards in ride-sharing, offering competitive pricing and 24/7 support, so you’re never left stranded.\nFrom city rides to long-distance journeys, our fleet of well-maintained vehicles and professional drivers ensure that you always arrive on time. At  Burlington City Cab, your journey isn’t just about getting from point A to point B; it’s about enjoying the ride, every step of the way. Trust us to be your go-to ride, wherever life takes you.",
            style: TextStyle(
                fontSize: descriptionfontsize,
                color: Colors.white,
              // overflow: TextOverflow.ellipsis
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10,),
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
            onPressed: onBookNowPressed,
            child: Text(
              "Contact Now",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
