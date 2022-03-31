import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_site/pages/services/animated_container.dart';
import '../../widgets/SizeWidget.dart';
import '../../widgets/appBar.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/drawer.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool vis = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            SizeWidget.isPhoneScreen(context)
                ? const SmallAppBar()
                : PrefSizeAppBar(
              shadow: null,
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: StaggeredGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: SizeWidget.isSmallScreen(context) ||
                        SizeWidget.isMediumScreen(context)
                    ? 1
                    : 3,
                children: [
                  StaggeredGrid.count(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        StaggeredGridTile.count(
                            mainAxisCellCount:
                                SizeWidget.isSmallScreen(context) ||
                                        SizeWidget.isMediumScreen(context)
                                    ? 0.5
                                    : 0.7,
                            crossAxisCellCount: 1,
                            child: const MyServiceContainer(
                              route: '/serviceInfoRemont',
                              centerText: 'Ремонт и отделка',
                              assets: 'assets/services/1.jpg',
                            )),
                        StaggeredGridTile.count(
                            mainAxisCellCount:
                                SizeWidget.isSmallScreen(context) ||
                                        SizeWidget.isMediumScreen(context)
                                    ? 0.5
                                    : 0.7,
                            crossAxisCellCount: 1,
                            child: const MyServiceContainer(
                              route: '/serviceInfoLandshaft',
                              centerText: 'Ландшафтный дизайн',
                              assets: 'assets/services/4.jpg',
                            )),
                      ]),
                  StaggeredGridTile.count(
                      mainAxisCellCount: SizeWidget.isSmallScreen(context) ||
                              SizeWidget.isMediumScreen(context)
                          ? 0.5
                          : 1.4,
                      crossAxisCellCount: SizeWidget.isSmallScreen(context) ||
                              SizeWidget.isMediumScreen(context)
                          ? 1
                          : 2,
                      child: const MyServiceContainer(
                          route: '/serviceInfoBuild',
                          assets: 'assets/services/3.jpg',
                          centerText: 'Строительство')),
                  StaggeredGridTile.count(
                      mainAxisCellCount: SizeWidget.isSmallScreen(context) ||
                              SizeWidget.isMediumScreen(context)
                          ? 0.5
                          : 1.4,
                      crossAxisCellCount: SizeWidget.isSmallScreen(context) ||
                              SizeWidget.isMediumScreen(context)
                          ? 1
                          : 2,
                      child: const MyServiceContainer(
                        route: '/serviceInfoInterier',
                        centerText: 'Дизайн интерьера',
                        assets: 'assets/services/2.jpg',
                      )),
                  StaggeredGrid.count(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        StaggeredGridTile.count(
                            mainAxisCellCount:
                                SizeWidget.isSmallScreen(context) ||
                                        SizeWidget.isMediumScreen(context)
                                    ? 0.5
                                    : 0.7,
                            crossAxisCellCount: 1,
                            child: const MyServiceContainer(
                                route: '/serviceInfoBuild',
                                assets: 'assets/services/5.jpg',
                                centerText: 'Разработка котлованов')),
                        StaggeredGridTile.count(
                            mainAxisCellCount:
                                SizeWidget.isSmallScreen(context) ||
                                        SizeWidget.isMediumScreen(context)
                                    ? 0.5
                                    : 0.7,
                            crossAxisCellCount: 1,
                            child: const MyServiceContainer(
                              route: '/serviceInfoLandshaft',
                              centerText: 'Геодезия',
                              assets: 'assets/services/6.jpg',
                            )),
                      ]),
                ],
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    ));
  }
}
