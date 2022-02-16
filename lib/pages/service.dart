import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_site/widgets/animated_container.dart';
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
                child: const PrefSizeAppBar(
                  dividerColor: Colors.white54,
                  shadow: null,
                  colorDrawer: Colors.blue,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: StaggeredGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: const [
                    StaggeredGridTile.count(
                        mainAxisCellCount: 0.8,
                        crossAxisCellCount: 1,
                        child: MyServiceContainer(
                            assets: 'assets/services/3.jpg',
                            centerText: 'Строительство')),
                    StaggeredGridTile.count(
                        mainAxisCellCount: 0.8,
                        crossAxisCellCount: 2,
                        child: MyServiceContainer(
                          centerText: 'Ремонт и отделка',
                          assets: 'assets/services/2.jpg',
                        )),
                    StaggeredGridTile.count(
                        mainAxisCellCount: 0.8,
                        crossAxisCellCount: 2,
                        child: MyServiceContainer(
                          centerText: 'Дизайн интерьера',
                          assets: 'assets/services/1.jpg',
                        )),
                    StaggeredGridTile.count(
                        mainAxisCellCount: 0.8,
                        crossAxisCellCount: 1,
                        child: MyServiceContainer(
                          centerText: 'Ландшафтный дизайн',
                          assets: 'assets/services/4.jpg',
                        )),
                  ],
                ),
              ),

              // GridView.count(
              //   padding: const EdgeInsets.all(10),
              //   crossAxisSpacing:10,
              //   mainAxisSpacing: 10,
              //   childAspectRatio: 1.5,
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   crossAxisCount: 2,
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.black.withOpacity(0.5),
              //               spreadRadius: 1,
              //               blurRadius: 5,
              //               offset: const Offset(
              //                   0, 3), // changes position of shadow
              //             ),
              //           ],
              //         borderRadius: const BorderRadius.all(Radius.circular(20)),
              //           image: const DecorationImage(
              //               image: AssetImage('assets/services/3.jpg'),
              //               fit: BoxFit.cover)),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.black.withOpacity(0.5),
              //               spreadRadius: 1,
              //               blurRadius: 5,
              //               offset: const Offset(
              //                   0, 3), // changes position of shadow
              //             ),
              //           ],
              //           borderRadius: const BorderRadius.all(Radius.circular(20)),
              //           image: const DecorationImage(
              //               image: AssetImage('assets/services/2.jpg'),
              //               fit: BoxFit.cover)),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.black.withOpacity(0.5),
              //               spreadRadius: 1,
              //               blurRadius: 5,
              //               offset: const Offset(
              //                   0, 3), // changes position of shadow
              //             ),
              //           ],
              //           borderRadius: const BorderRadius.all(Radius.circular(20)),
              //           image: const DecorationImage(
              //               image: AssetImage('assets/services/1.jpg'),
              //               fit: BoxFit.cover)),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.black.withOpacity(0.5),
              //               spreadRadius: 1,
              //               blurRadius: 5,
              //               offset: const Offset(
              //                   0, 3), // changes position of shadow
              //             ),
              //           ],
              //           borderRadius: const BorderRadius.all(Radius.circular(20)),
              //           image: const DecorationImage(
              //               image: AssetImage('assets/services/4.jpg'),
              //               fit: BoxFit.cover)),
              //     ),
              //   ],
              // ),

              const BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
