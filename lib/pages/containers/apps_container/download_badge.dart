import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadBadge extends StatelessWidget {
  final String imageUrl;     // URL or local asset path for badge icon
  final String text;         // e.g. "Download on the App Store"
  final String url;          // target link
  final double height;
  final double elevation;

  const DownloadBadge({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.url,
    this.height = 80,
    this.elevation = 4,
  });

  void _launchURL(BuildContext context) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: InkWell(
        onTap: () => _launchURL(context),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imageUrl,
                height: height * 0.5,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              Column(
                children: [
                  Text(
                    'Download the app on',
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  // SizedBox(height: 1,),
                  Text(
                    text,
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize:height * 0.3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
     /*         const SizedBox(width: 4),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white)*/
            ],
          ),
        ),
      ),
    );
  }
}