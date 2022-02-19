import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_site/widgets/animated_container.dart';
import '../widgets/SizeWidget.dart';
import '../widgets/appBar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/drawer.dart';


class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize:MainAxisSize.max,
            children: [

              SizeWidget.isPhoneScreen(context)
                  ? const SmallAppBar()
                  : const PrefSizeAppBar(
                dividerColor: Colors.white54,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: StaggeredGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: SizeWidget.isSmallScreen(context)||SizeWidget.isMediumScreen(context)?1:3,
                  children: [
                    StaggeredGridTile.count(
                        mainAxisCellCount: SizeWidget.isSmallScreen(context)||SizeWidget.isMediumScreen(context)?0.5:1,
                        crossAxisCellCount: 1,
                        child: const MyServiceContainer(
                            assets: 'assets/services/3.jpg',
                            centerText: 'Строительство')),
                    StaggeredGridTile.count(
                        mainAxisCellCount: SizeWidget.isSmallScreen(context)||SizeWidget.isMediumScreen(context)?0.5:1,
                        crossAxisCellCount:SizeWidget.isSmallScreen(context)||SizeWidget.isMediumScreen(context)?1:2,
                        child: const MyServiceContainer(
                          centerText: 'Ремонт и отделка',
                          assets: 'assets/services/1.jpg',
                        )),
                    StaggeredGridTile.count(
                        mainAxisCellCount: SizeWidget.isSmallScreen(context)||SizeWidget.isMediumScreen(context)?0.5:1,
                        crossAxisCellCount: SizeWidget.isSmallScreen(context)||SizeWidget.isMediumScreen(context)?1:2,
                        child: const MyServiceContainer(
                          centerText: 'Дизайн интерьера',
                          assets: 'assets/services/2.jpg',
                        )),
                    StaggeredGridTile.count(
                        mainAxisCellCount:SizeWidget.isSmallScreen(context)||SizeWidget.isMediumScreen(context)?0.5:1,
                        crossAxisCellCount: 1,
                        child: const MyServiceContainer(
                          centerText: 'Ландшафтный дизайн',
                          assets: 'assets/services/4.jpg',
                        )),
                  ],
                ),
              ),

              const BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}