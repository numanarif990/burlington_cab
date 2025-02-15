import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/pages/containers/container2.dart';
import 'package:web_app/pages/containers/container3.dart';
import 'package:web_app/utils/colors.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

 import 'dart:html';
import '../../utils/constants.dart';

class Container5 extends StatefulWidget {
  const Container5({super.key});

  @override
  State<Container5> createState() => _Container5State();
}

class _Container5State extends State<Container5> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const DesktopContainer5(),
      mobile: const MobileContainer5(),
      tablet: const TabletContainer5(),
    );
  }
}

class TabletContainer5 extends StatefulWidget {
  const TabletContainer5({super.key});

  @override
  State<TabletContainer5> createState() => _TabletContainer5State();
}

class _TabletContainer5State extends State<TabletContainer5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width * 1.5,
        minHeight: MediaQuery.of(context).size.width * 1.5,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          const titlebox(title: "Contact Us"),
          const SizedBox(height: 15,),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactHeading(title: "PHONE"),
              PhoneNumber(number: "905-929-3333"),
              Underline()
            ],
          ),
          const SizedBox(height: 15,),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactHeading(title: "EMAIL"),
              Mail(mail: "dispatch@burlingtoncitycab.ca"),
              Underline()
            ],
          ),
          const SizedBox(height: 15,),
          const Column(children: [
            ContactHeading(title: "ADDRESS"),
            Address(),
            Underline(),
          ],),
          const SizedBox(height: 15,),
          SizedBox(
            width: w!*0.7,  // Set appropriate width and height for iframe
            height: w!*0.5, // Set appropriate height and width for iframe
            child: const MapLocation(),
          )
        ],
      ),
    );
  }
}

class MobileContainer5 extends StatefulWidget {
  const MobileContainer5({super.key});

  @override
  State<MobileContainer5> createState() => _MobileContainer5State();
}

class _MobileContainer5State extends State<MobileContainer5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width * 1.5,
        minHeight: MediaQuery.of(context).size.width * 1.4,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          const titlebox(title: "Contact Us"),
          const SizedBox(height: 15,),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactHeading(title: "PHONE"),
              PhoneNumber(number: "905-929-3333"),
              Underline()
            ],
          ),
          const SizedBox(height: 15,),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactHeading(title: "EMAIL"),
              Mail(mail: "dispatch@burlingtoncitycab.ca"),
              Underline()
            ],
          ),
          const SizedBox(height: 15,),
          const Column(children: [
            ContactHeading(title: "ADDRESS"),
            Address(),
            Underline(),
          ],),
          const SizedBox(height: 15,),
          SizedBox(
            width: w!*0.7,  // Set appropriate width and height for iframe
            height: w!*0.5, // Set appropriate height and width for iframe
            child: const MapLocation(),
          )
        ],
      ),
    );
  }
}


class DesktopContainer5 extends StatefulWidget {
  const DesktopContainer5({super.key});

  @override
  State<DesktopContainer5> createState() => _DesktopContainer5State();
}

class _DesktopContainer5State extends State<DesktopContainer5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 1.2,
        minHeight: MediaQuery.of(context).size.height * 1.1,
      ),
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          const titlebox(title: "Contact Us"),
          const SizedBox(height: 15,),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactHeading(title: "PHONE"),
              PhoneNumber(number: "905-929-3333"),
              Underline()
            ],
          ),
          const SizedBox(height: 15,),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactHeading(title: "EMAIL"),
              Mail(mail: "dispatch@burlingtoncitycab.ca"),
              Underline()
            ],
          ),
          const SizedBox(height: 15,),
          const Column(children: [
            ContactHeading(title: "ADDRESS"),
            Address(),
            Underline(),
          ],),
          const SizedBox(height: 15,),
          SizedBox(
            width: w!*0.4,  // Set appropriate width and height for iframe
            height: h!*0.5, // Set appropriate height and width for iframe
            child: const MapLocation(),
          )
        ],
      ),
    );
  }
}


class Underline extends StatelessWidget {
  const Underline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w!*0.5,
      height: 1,
      color: Colors.grey,
    );
  }
}
class ContactHeading extends StatelessWidget {
  final String title;

  const ContactHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardColor,
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      ),
    );
  }
}

class PhoneNumber extends StatelessWidget {
  final String number;
  const PhoneNumber({super.key, required this.number});
  void _launchPhoneDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchPhoneDialer(number),
        // Add your phone number here
        child: Text(
          number,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}


class Mail extends StatelessWidget {
  final String mail;
  const Mail({super.key , required this.mail});
  void _launchEmailApp(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
      'subject=Hello&body=Please reach out to me.', // You can modify the subject and body
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
  @override
  Widget build(BuildContext context) {
    return  MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchEmailApp(mail),
        // Add your email address here
        child: Text(
          mail,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
                    ),
        ),
      ),
    );
  }
}


class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Burlington City Cab Corp.\n5063 N Service Rd, Burlington, Ontario",style: TextStyle(
      fontSize: 18,
      color: AppColors.primaryColor,
    ),
    textAlign: TextAlign.center,
    );
  }
}

class MapLocation extends StatefulWidget {
  const MapLocation({super.key});

  @override
  State<MapLocation> createState() => _MapLocationState();
}
class _MapLocationState extends State<MapLocation> {
  final String viewType = 'iframeElement';
  void initState() {
    super.initState();

    if (kIsWeb) {
      // Register the view factory once
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
        // Create the iframe element
        final iframe = IFrameElement()
          ..width = '800'
          ..height = '600'
          ..src = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2899.6309567167!2d-79.7723749253548!3d43.384739969755046!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882b614ec98ab7e1%3A0x3f706f480f2cf45!2sBurlington%20City%20Cab%20%26%20Taxi%20Services!5e0!3m2!1sen!2s!4v1728478791194!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade' // Replace with your desired URL
          ..style.border = 'none';

        return iframe;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: kIsWeb
          ? SizedBox(
        width: 800,
        height: 600,
        child: HtmlElementView(viewType: viewType),
      )
          : const Text('Iframes are only supported on the web.'),
    );
  }
}



class SentMessageBox extends StatefulWidget {
  const SentMessageBox({super.key});

  @override
  State<SentMessageBox> createState() => _SentMessageBoxState();
}

class _SentMessageBoxState extends State<SentMessageBox> {
  final TextEditingController _messageController = TextEditingController();
  bool _isMessageSent = false;

  void _sendMessage(String message) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'chand@burlingtoncitycab.ca',
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Message",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // TextField to input the message
            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Enter your message here",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Send button
            ElevatedButton(
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
              child: const Text("Send Message"),
            ),

            // Confirmation message
            if (_isMessageSent)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Message sent successfully!",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
