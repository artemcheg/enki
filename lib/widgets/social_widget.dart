import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            hoverColor: Colors.grey.withOpacity(0),
            onTap: () async {
              launch(
                'https://www.instagram.com/enki.crimea/',
              );
            },
            child: Image.asset(
              'assets/social/insta.png',
            )),
        InkWell(
            hoverColor: Colors.grey.withOpacity(0),
            onTap: () async {
              launch(
                'https://vk.com/enki.crimea',
              );
            },
            child: Image.asset(
              'assets/social/vk.png',
              scale: 1.24,
            )),
      ],
    );
  }
}