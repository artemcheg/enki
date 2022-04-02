import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_site/resources/image_res.dart';
import 'package:web_site/widgets/bottom_bar.dart';
import 'package:web_site/widgets/drawer.dart';
import 'package:web_site/widgets/small_changes.dart';
import '../../widgets/SizeWidget.dart';
import '../../widgets/appBar.dart';
import 'model.dart';

class PortfolioMain extends StatefulWidget {
  const PortfolioMain({Key? key}) : super(key: key);

  @override
  State<PortfolioMain> createState() => _PortfolioMainState();
}

class _PortfolioMainState extends State<PortfolioMain>
    with SingleTickerProviderStateMixin {
  int page = 0;
  final _model = ImageModel();

  void setPage(int index) {
    setState(() {
      page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const MyDrawer(),
        body: NestedScrollView(
        controller: ScrollController(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                  child: Column(children: [
                SizeWidget.isPhoneScreen(context)
                    ? const SmallAppBar()
                    : PrefSizeAppBar(
                        shadow: null,
                      ),
                Container(
                  margin: SizeWidget.isSmallScreen(context)
                      ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                      : const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                  decoration: const BoxDecoration(
                      color: Color(0xff4b636e),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: shadowBox),
                  child: const TabBar(
                    indicator: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        color: Color(0XFF52B060)),
                    tabs: [
                      TabBarItem(
                        text: 'Строительство',
                      ),
                      TabBarItem(
                        text: 'Отделка',
                      ),
                      TabBarItem(
                        text: 'Дизайн интерьера',
                      ),
                      TabBarItem(
                        text: 'Ландшафтный дизайн',
                      ),
                    ],
                  ),
                ),
              ]))
            ];
          },
          body: UpdateImageIndexWidget(
            model: _model,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child:const RepaintBoundary(
                child:  TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      TabBarScreen(
                        assets: ImageRes.stroika,
                      ),
                      TabBarScreen(
                        assets: ImageRes.otdelka,
                      ),
                      TabBarScreen(
                        assets: ImageRes.dizain,
                      ),
                      TabBarScreen(
                        assets: ImageRes.landshaft,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarItem extends StatefulWidget {
  final String text;

  const TabBarItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<TabBarItem> createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: SizeWidget.isSmallScreen(context) ? 30 : 50,
      child: Text(
        widget.text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: sizeParam(width, 0.01, 8),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class TabBarScreen extends StatefulWidget {
  final List assets;

  const TabBarScreen({Key? key, required this.assets}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

  Future<Widget> futureListView() async{
    return const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.custom(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                return InkWell(
                  onTap: () {
                    UpdateImageIndexWidget.read(context)
                        ?.result(index, context, widget.assets);
                  },
                  child: ClipRRect(
                    borderRadius: SizeWidget.isSmallScreen(context)
                        ? BorderRadius.circular(10)
                        : BorderRadius.circular(20),
                    child: RepaintBoundary(
                      child: Image.asset(
                        widget.assets[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }, childCount: widget.assets.length),
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }
}


