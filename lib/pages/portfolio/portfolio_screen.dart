import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_site/animation/transit_anim.dart';
import 'package:web_site/widgets/bottom_bar.dart';
import 'package:web_site/widgets/drawer.dart';
import 'package:web_site/widgets/small_changes.dart';

import '../../animation/direction.dart';
import '../../widgets/SizeWidget.dart';
import '../../widgets/appBar.dart';

class PortfolioMain extends StatefulWidget {
  const PortfolioMain({Key? key}) : super(key: key);

  @override
  State<PortfolioMain> createState() => _PortfolioMainState();
}

class _PortfolioMainState extends State<PortfolioMain>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int page = 0;
  final _model = ImageModel();

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() {
      setPage(controller.index);
    });
    super.initState();
  }

  void setPage(int index) {
    setState(() {
      page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
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
                    : const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: const BoxDecoration(
                    color: Color(0xff4b636e),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: shadowBox),
                child: TabBar(
                  controller: controller,
                  indicator: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      color: Color(0XFF52B060)),
                  tabs: const [
                    TabBarItem(
                      text: 'Строительство',
                    ),
                    TabBarItem(
                      text: 'Ремонт',
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
          child: Stack(
            children: [
              TabBarView(controller: controller, children: const [
                TabBarScreen(),
                Center(
                  child: Text('vznt'),
                ),
                Center(
                  child: Text('vznt'),
                ),
                Center(
                  child: Text('vznt'),
                ),
              ]),
            ],
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
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  image(int index) => "assets/portfolio/otdelka/$index.jpg";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.custom(
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
                return TransitionAnimation(
                  offset: -0.4,
                  direct: Direct.horizontal,
                  animTime: const Duration(milliseconds: 400),
                  child: InkWell(
                    onTap: () {
                      UpdateImageIndexWidget.of(context)
                          .model
                          .result(image(index + 1), true, context);
                    },
                    child: ClipRRect(
                      borderRadius: SizeWidget.isSmallScreen(context)
                          ? BorderRadius.circular(10)
                          : BorderRadius.circular(20),
                      child: Image.asset(
                        image(index + 1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }, childCount: 19),
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }
}

class ImageDialog extends StatefulWidget {
  final String asset;

  const ImageDialog({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            Image.asset(
              widget.asset,
              fit: BoxFit.contain,
            ),
            Positioned(
              right: 25,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpdateImageIndexWidget extends InheritedWidget {
  final ImageModel model;

  const UpdateImageIndexWidget({
    required this.model,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static UpdateImageIndexWidget of(BuildContext context) {
    final UpdateImageIndexWidget? result =
        context.dependOnInheritedWidgetOfExactType<UpdateImageIndexWidget>();
    assert(result != null, 'No UpdateImageIndex found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UpdateImageIndexWidget oldWidget) {
    return model != oldWidget.model;
  }
}

class ImageModel extends ChangeNotifier {
  String asset = '';

  void result(String asset, bool show, BuildContext context) {
    this.asset = asset;
    showDialog(
      barrierDismissible: true ,
        context: context,
        builder: (BuildContext context) {
          return ImageDialog(
            asset: asset,
          );
        });
    notifyListeners();
  }
}
