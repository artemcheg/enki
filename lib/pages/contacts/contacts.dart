import 'package:flutter/material.dart';
import 'package:web_site/animation/transit_anim.dart';
import 'package:web_site/pages/contacts/map_contact.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/drawer.dart';

import '../../widgets/SizeWidget.dart';
import '../../widgets/appBar.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/carousel.dart';
import '../../widgets/rich_text.dart';
import '../../widgets/social_widget.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (SizeWidget.isSmallScreen(context)) {
              return const ContactsSmall();
            } else {
              return const ContactsLarge();
            }
          },
        ),
      ),
    );
  }
}

class ContactsLarge extends StatefulWidget {
  const ContactsLarge({Key? key}) : super(key: key);

  @override
  _ContactsLargeState createState() => _ContactsLargeState();
}

class _ContactsLargeState extends State<ContactsLarge> {
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scrollbar(
      controller: _scrollController,
      trackVisibility: true,
      showTrackOnHover: true,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: isScrolling
            ? const ClampingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrefSizeAppBar(
                shadow: null,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 350,
                        height: 800,
                        width: 330,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            TransitionAnimation(
                              child: ListTile(
                                title: MyRichText(
                                  weight: null,
                                  shadow: null,
                                  colorText: Colors.black,
                                  text: StringRes.phone,
                                  maxLines: 1,
                                  what: 'tel:${StringRes.phone}',
                                  sizeParam: null,
                                ),
                                leading: Icon(
                                  Icons.phone,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            TransitionAnimation(
                              child: ListTile(
                                title: MyRichText(
                                  weight: null,
                                  shadow: null,
                                  colorText: Colors.black,
                                  text: StringRes.phoneSecond,
                                  maxLines: 1,
                                  what: 'tel:${StringRes.phoneSecond}',
                                  sizeParam: null,
                                ),
                                leading: Icon(
                                  Icons.phone,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                            ),
                            RepaintBoundary(
                              child: TransitionAnimation(
                                durationStart: Duration(milliseconds: 500),
                                child: ListTile(
                                  title: MyRichText(
                                    weight: null,
                                    shadow: null,
                                    colorText: Colors.black,
                                    text: StringRes.mail,
                                    sizeParam: null,
                                    what: 'mailto:${StringRes.mail}',
                                  ),
                                  leading: Icon(
                                    Icons.mail,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              ),
                            ),
                            RepaintBoundary(
                              child: TransitionAnimation(
                                durationStart: Duration(milliseconds: 1000),
                                child: ListTile(
                                  title: MyRichText(
                                    weight: null,
                                    shadow: null,
                                    colorText: Colors.black,
                                    text: StringRes.address,
                                    sizeParam: null,
                                    maxLines: 4,
                                    what:
                                        'https://yandex.ru/maps/146/simferopol/house/ulitsa_turgeneva_13a/Z00YdwZkTEEAQFpufXV0cHRkZw==/?from=tabbar&ll=34.114722%2C44.951856&source=serp_navig&z=20',
                                    webOnlyWindowName: '_blank',
                                  ),
                                  leading: Icon(
                                    Icons.place,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            RepaintBoundary(
                              child: TransitionAnimation(
                                durationStart: Duration(milliseconds: 1500),
                                child: ListTile(
                                  title: SelectableText(StringRes.workTime),
                                  leading: Icon(
                                    Icons.watch,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 50),
                              child: TransitionAnimation(
                                  durationStart: Duration(milliseconds: 2000),
                                  child: SocialWidget()),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: RepaintBoundary(
                          child: TransitionAnimation(
                              child: MouseRegion(
                            onHover: (value) {
                              setState(() {
                                isScrolling = false;
                              });
                            },
                            onExit: (value) {
                              setState(() {
                                isScrolling = true;
                              });
                            },
                            child: GestureDetector(
                                onVerticalDragCancel: () {
                                  setState(() {
                                    isScrolling = true;
                                  });
                                },
                                onVerticalDragUpdate: (d) {
                                  setState(() {
                                    isScrolling = false;
                                  });
                                },
                                onVerticalDragEnd: (d) {
                                  setState(() {
                                    isScrolling = true;
                                  });
                                },
                                onVerticalDragStart: (d) {
                                  setState(() {
                                    isScrolling = false;
                                  });
                                },
                                onHorizontalDragEnd: (d) {
                                  setState(() {
                                    isScrolling = true;
                                  });
                                },
                                onHorizontalDragCancel: () {
                                  setState(() {
                                    isScrolling = true;
                                  });
                                },
                                onHorizontalDragUpdate: (d) {
                                  setState(() {
                                    isScrolling = false;
                                  });
                                },
                                onHorizontalDragStart: (d) {
                                  setState(() {
                                    isScrolling = false;
                                  });
                                },
                                child: mapContact(screenSize.width * 0.8,
                                    screenSize.height * 0.7)),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Наш офис:",
                  style: TextStyle(
                    fontSize: sizeParam(screenSize.width, 0.015, 20),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Carousel(),
              const BottomBar(),
            ]),
      ),
    );
  }
}

class ContactsSmall extends StatefulWidget {
  const ContactsSmall({Key? key}) : super(key: key);

  @override
  _ContactsSmallState createState() => _ContactsSmallState();
}

class _ContactsSmallState extends State<ContactsSmall> {
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scrollbar(
      controller: _scrollController,
      trackVisibility: true,
      showTrackOnHover: true,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: isScrolling
            ? const ClampingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SmallAppBar(
              shadow: null,
              colorDrawer: Colors.white,
            ),
            SizedBox(
              height: 400,
              width: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  RepaintBoundary(
                    child: TransitionAnimation(
                      child: ListTile(
                        title: MyRichText(
                          shadow: null,
                          colorText: Colors.black,
                          weight: null,
                          text: StringRes.phone,
                          maxLines: 1,
                          what: 'tel:${StringRes.phone}',
                          sizeParam: null,
                        ),
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: TransitionAnimation(
                      child: ListTile(
                        title: MyRichText(
                          shadow: null,
                          colorText: Colors.black,
                          weight: null,
                          text: StringRes.phoneSecond,
                          maxLines: 1,
                          what: 'tel:${StringRes.phoneSecond}',
                          sizeParam: null,
                        ),
                        leading: Icon(
                          Icons.phone,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: TransitionAnimation(
                      durationStart: Duration(milliseconds: 500),
                      child: ListTile(
                        title: MyRichText(
                          weight: null,
                          shadow: null,
                          colorText: Colors.black,
                          text: StringRes.mail,
                          sizeParam: null,
                          what: 'mailto:${StringRes.mail}',
                        ),
                        leading: Icon(
                          Icons.mail,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: TransitionAnimation(
                      durationStart: Duration(milliseconds: 1000),
                      child: ListTile(
                        title: MyRichText(
                          weight: null,
                          shadow: null,
                          colorText: Colors.black,
                          text: StringRes.address,
                          sizeParam: null,
                          maxLines: 4,
                          what:
                              'https://yandex.ru/maps/146/simferopol/house/ulitsa_turgeneva_13a/Z00YdwZkTEEAQFpufXV0cHRkZw==/?from=tabbar&ll=34.114722%2C44.951856&source=serp_navig&z=20',
                          webOnlyWindowName: '_blank',
                        ),
                        leading: Icon(
                          Icons.place,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: TransitionAnimation(
                      durationStart: Duration(milliseconds: 1500),
                      child: ListTile(
                        title: SelectableText(StringRes.workTime),
                        leading: Icon(
                          Icons.watch,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: TransitionAnimation(
                        durationStart: Duration(milliseconds: 2000),
                        child: SocialWidget()),
                  )
                ],
              ),
            ),
            RepaintBoundary(
              child: TransitionAnimation(
                  child: MouseRegion(
                onHover: (value) {
                  setState(() {
                    isScrolling = false;
                  });
                },
                onExit: (value) {
                  setState(() {
                    isScrolling = true;
                  });
                },
                child: GestureDetector(
                    onVerticalDragCancel: () {
                      setState(() {
                        isScrolling = true;
                      });
                    },
                    onVerticalDragUpdate: (d) {
                      setState(() {
                        isScrolling = false;
                      });
                    },
                    onVerticalDragEnd: (d) {
                      setState(() {
                        isScrolling = true;
                      });
                    },
                    onVerticalDragStart: (d) {
                      setState(() {
                        isScrolling = false;
                      });
                    },
                    onHorizontalDragEnd: (d) {
                      setState(() {
                        isScrolling = true;
                      });
                    },
                    onHorizontalDragCancel: () {
                      setState(() {
                        isScrolling = true;
                      });
                    },
                    onHorizontalDragUpdate: (d) {
                      setState(() {
                        isScrolling = false;
                      });
                    },
                    onHorizontalDragStart: (d) {
                      setState(() {
                        isScrolling = false;
                      });
                    },
                    child: mapContactPhone(
                        screenSize.width-20, screenSize.height * 0.6)),
              )),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Наш офис:",
                style: TextStyle(
                  fontSize: sizeParam(screenSize.width, 0.015, 20),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Carousel(),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
