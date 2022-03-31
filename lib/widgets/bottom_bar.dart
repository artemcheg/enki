import 'package:flutter/material.dart';
import 'package:web_site/widgets/rich_text.dart';
import 'package:web_site/widgets/social_widget.dart';
import '../resources/string_res.dart';
import 'SizeWidget.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  textStyle(screenWidth) => TextStyle(
      color: Colors.white, fontSize: sizeParam(screenWidth, 0.007, 8));

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: const Color(
          0xff263238),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: SizeWidget.isPhoneScreen(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Image.asset(
                        'assets/logo.png',
                        color: Colors.amberAccent,
                        width: sizeParam(screenSize.width, 0.1, 100),
                        height: sizeParam(screenSize.width, 0.03, 50),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      StringRes.bottomAbout,
                      textAlign: TextAlign.center,
                      style: textStyle(screenSize.width),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Контакты:',
                        style: textStyle(screenSize.width),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.amberAccent,
                          ),
                          MyRichText(
                            weight: null,
                            text: StringRes.phone,
                            sizeParam: sizeParam(screenSize.width, 0.007, 10),
                            what: 'tel:${StringRes.phone}',
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.amberAccent,
                          ),
                          MyRichText(
                            weight: null,
                            text: StringRes.phoneSecond,
                            sizeParam: sizeParam(screenSize.width, 0.007, 10),
                            what: 'tel:${StringRes.phoneSecond}',
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.mail_rounded,
                            color: Colors.amberAccent,
                          ),
                          MyRichText(
                            weight: null,
                            text: StringRes.mail,
                            sizeParam: sizeParam(screenSize.width, 0.007, 10),
                            what: 'mailto:${StringRes.mail}',
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        'Адрес:',
                        style: textStyle(screenSize.width),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          MyRichText(
                            weight: null,
                            maxLines: 3,
                            text: StringRes.address,
                            sizeParam: sizeParam(screenSize.width, 0.007, 10),
                            what:
                                'https://yandex.ru/maps/146/simferopol/house/ulitsa_turgeneva_13a/Z00YdwZkTEEAQFpufXV0cHRkZw==/?from=tabbar&ll=34.114722%2C44.951856&source=serp_navig&z=20',
                            webOnlyWindowName: '_blank',
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.white54,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Мы в социальных сетях:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeParam(screenSize.width, 0.008, 10)),
                ),
                const SizedBox(width: 10,),
                const SocialWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
