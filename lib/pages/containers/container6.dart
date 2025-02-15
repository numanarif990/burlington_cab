import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/pages/containers/container2.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class Container6 extends StatefulWidget {
  const Container6({super.key});

  @override
  State<Container6> createState() => _Container6State();
}

class _Container6State extends State<Container6> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const MobileContainer6(),
      desktop: const DesktopContainer6(),
      tablet: const TabletContainer6(),
    );
  }
}

class TabletContainer6 extends StatefulWidget {
  const TabletContainer6({super.key});

  @override
  State<TabletContainer6> createState() => _TabletContainer6State();
}

class _TabletContainer6State extends State<TabletContainer6> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: w, // Use screen width for Container
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width *0.67,
        minHeight: MediaQuery.of(context).size.width * 0.6,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const titlebox(title: "Send Message"),
          Expanded(
            child: MessageContainerMobile(flex: 1, maxwidth: w!,),
          ),
        ],
      ),
    );
  }
}

class MobileContainer6 extends StatefulWidget {
  const MobileContainer6({super.key});

  @override
  State<MobileContainer6> createState() => _MobileContainer6State();
}

class _MobileContainer6State extends State<MobileContainer6> {

  @override
  Widget build(BuildContext context) {
    // Replace Placeholder with your actual widget content
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: w, // Use screen width for Container
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width *1.22,
        minHeight: MediaQuery.of(context).size.width * 1.2,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const titlebox(title: "Send Message"),
          Expanded(
            child: MessageContainerMobile(flex: 1, maxwidth: w!,),
          ),
        ],
      ),
    );
  }
}

class MessageContainerMobile extends StatelessWidget {
  final double maxwidth;
  final int flex;
  const MessageContainerMobile({super.key, required this.maxwidth, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      constraints: BoxConstraints(
        maxWidth: maxwidth, // Adjusts width based on screen size
      ),
      child:Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: flex,
              child: const DecoratedTextField1Mobile(label: "Enter your name", maxlines: 1)),
          const SizedBox(height: 10,),
          Expanded(
              flex: flex,
              child: const DecoratedTextField1Mobile(label: "Enter your email", maxlines: 1)),
          const SizedBox(height: 10,),

          const DecoratedTextField(label: "Enter your message", maxlines: 10),
        ],
      ),
    );
  }
}


class DesktopContainer6 extends StatefulWidget {
  const DesktopContainer6({super.key});

  @override
  State<DesktopContainer6> createState() => _DesktopContainer6State();
}

class _DesktopContainer6State extends State<DesktopContainer6> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth, // Use screen width for Container
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height *0.8,
        minHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const titlebox(title: "Send Message"),
          Expanded(
            child: MessageContainer(flex: 3, maxwidth: w!*0.7,),
          ),
        ],
      ),
    );
  }
}

class MessageContainer extends StatelessWidget {
  final double maxwidth;
  final int flex;
  const MessageContainer({super.key, required this.flex, required this.maxwidth});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      constraints: BoxConstraints(
        maxWidth: maxwidth, // Adjusts width based on screen size
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: flex,
                  child: const DecoratedTextField1(label: "Enter your name", maxlines: 1)),
              const SizedBox(width: 30),
              Expanded(
                  flex: flex,
                  child: const DecoratedTextField1(label: "Enter your email", maxlines: 1)),
            ],
          ),
          const SizedBox(height: 15),
          const DecoratedTextField(label: "Enter your message", maxlines: 10),
        ],
      ),
    );
  }
}



class DecoratedTextField extends StatefulWidget {
  final String label;
  final int maxlines;
  const DecoratedTextField({super.key,required this.label, required this.maxlines});

  @override
  State<DecoratedTextField> createState() => _DecoratedTextFieldState();
}

class _DecoratedTextFieldState extends State<DecoratedTextField> {
  TextEditingController _messageController = TextEditingController();
  bool _isMessageSent = false;

  void _sendMessage(String message) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'dispatch@burlingtoncitycab.ca',
      query: 'subject=User Message&body=$message',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
      _showMessageSentConfirmation();
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  void _showMessageSentConfirmation() {
    setState(() {
      _isMessageSent = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Your message is being sent"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          controller: _messageController,
          maxLines: widget.maxlines,
          cursorColor: Colors.white,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.white
          ),
          decoration: InputDecoration(
            hintText: widget.label,
            fillColor: AppColors.cardColor,
            filled: true,
            hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.withOpacity(.8)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Custom border color
                width: 1,
              ),
            ),

            floatingLabelStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white
            ),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.grey, // Custom border color when enabled
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.white, // Custom border color when focused
                width: 2,
              ),
            ),
          ),
        ),
              ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 4, // Set initial elevation to 0
              shadowColor: Colors.grey, // Set shadow color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              if (_messageController.text.isNotEmpty) {
                _sendMessage(_messageController.text);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please enter a message before sending."),
                  ),
                );
              }
            },
            child: Text(
              "Send",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

    ]
    );
  }
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}



class DecoratedTextField1 extends StatelessWidget {
  final String label;
  final int maxlines;
  const DecoratedTextField1({super.key, required this.label, required this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Container(

      // margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(

        maxLines: maxlines,
        cursorColor: Colors.white,
        cursorHeight: 16,
        style: const TextStyle(
            fontSize: 16,
            color: Colors.white
        ),
        decoration: InputDecoration(
          hintText: label,
          fillColor: AppColors.cardColor,
          filled: true,
          hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey.withOpacity(.8)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey, // Custom border color
              width: 1,
            ),
          ),

          floatingLabelStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white
          ),
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey, // Custom border color when enabled
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.white, // Custom border color when focused
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}



class DecoratedTextField1Mobile extends StatelessWidget {
  final String label;
  final int maxlines;
  const DecoratedTextField1Mobile({super.key, required this.label, required this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Container(

      // margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(

        maxLines: maxlines,
      cursorColor: Colors.white,
        cursorHeight: w!*0.028,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white
        ),
        decoration: InputDecoration(
          hintText: label,
          fillColor: AppColors.cardColor,
          filled: true,
          hintStyle: TextStyle(
            fontSize: w!*0.028,
            color: Colors.grey.withOpacity(.8)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey, // Custom border color
              width: 1,
            ),
          ),

          floatingLabelStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey, // Custom border color when enabled
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.white, // Custom border color when focused
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  const Button({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 4, // Set initial elevation to 0
        shadowColor: Colors.grey, // Set shadow color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Text(
       title,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

