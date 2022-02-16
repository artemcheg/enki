import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_site/widgets/animated_container.dart';
import '../widgets/SizeWidget.dart';
import '../widgets/appBar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/drawer.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.withOpacity(0.1),
      extendBodyBehindAppBar: true,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (SizeWidget.isSmallScreen(context)) {
                      return const SmallAppBar();
                    } else {
                      return const PrefSizeAppBar(
                        dividerColor: Colors.white54,
                        shadow: null,
                        colorDrawer: Colors.blue,
                      );
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: StaggeredGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    StaggeredGridTile.count(
                        mainAxisCellCount: !SizeWidget.isLargeScreen(context)?1.5:1,
                        crossAxisCellCount: 1,
                        child: const MyServiceContainer(
                            assets: 'assets/services/3.jpg',
                            centerText: 'Строительство')),
                    StaggeredGridTile.count(
                        mainAxisCellCount: !SizeWidget.isLargeScreen(context)?1.5:1,
                        crossAxisCellCount: 2,
                        child: const MyServiceContainer(
                          centerText: 'Ремонт и отделка',
                          assets: 'assets/services/2.jpg',
                        )),
                    StaggeredGridTile.count(
                        mainAxisCellCount: !SizeWidget.isLargeScreen(context)?1.5:1,
                        crossAxisCellCount: 2,
                        child: const MyServiceContainer(
                          centerText: 'Дизайн интерьера',
                          assets: 'assets/services/1.jpg',
                        )),
                    StaggeredGridTile.count(
                        mainAxisCellCount: !SizeWidget.isLargeScreen(context)?1.5:1,
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
