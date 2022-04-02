//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:web_site/resources/image_res.dart';
// import '../../widgets/SizeWidget.dart';
// import '../../widgets/appBar.dart';
// import '../../widgets/bottom_bar.dart';
// import '../../widgets/small_changes.dart';
// import 'model.dart';
//
//
// class PortfolioMain2 extends StatefulWidget {
//   const PortfolioMain2({Key? key}) : super(key: key);
//
//   @override
//   State<PortfolioMain2> createState() => _PortfolioMain2State();
// }
//
// class _PortfolioMain2State extends State<PortfolioMain2> with SingleTickerProviderStateMixin {
//   late TabController controller;
//   int page = 0;
//   final _model = ImageModel();
//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 4, vsync: this);
//     controller.addListener(() {changePosition(controller.index);});
//   }
//
//   void changePosition(int index){
//     setState(() {
//       page = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: UpdateImageIndexWidget(
//           model: _model,
//           child: Column(children: [
//             SizeWidget.isPhoneScreen(context)
//                 ? const SmallAppBar()
//                 : PrefSizeAppBar(
//               shadow: null,
//             ),
//             Container(
//               margin: SizeWidget.isSmallScreen(context)
//                   ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
//                   : const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               decoration: const BoxDecoration(
//                   color: Color(0xff4b636e),
//                   borderRadius: BorderRadius.all(Radius.circular(50)),
//                   boxShadow: shadowBox),
//               child:  const RepaintBoundary(
//                 child: MyTabBar(),
//               ),
//             ),
//
//             const MainScreenPort(),
//
//             const BottomBar()
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
// class MainScreenPort extends StatefulWidget {
//   const MainScreenPort({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MainScreenPort> createState() => _MainScreenPortState();
// }
//
// class _MainScreenPortState extends State<MainScreenPort> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context,constrained){
//       if(UpdateImageIndexWidget.of(context)?.page==0){
//         return const TabBarScreen2(
//           assets: ImageRes.stroika,
//         );
//       }else if(UpdateImageIndexWidget.of(context)?.page==1){
//         return const TabBarScreen2(
//           assets: ImageRes.otdelka,
//         );
//       }else if(UpdateImageIndexWidget.of(context)?.page==2){
//         return const TabBarScreen2(
//           assets: ImageRes.dizain,
//         );
//       }else{
//         return const TabBarScreen2(
//           assets: ImageRes.landshaft,
//         );
//       }
//     });
//   }
// }
//
// class MyTabBar extends StatefulWidget {
//   const MyTabBar({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MyTabBar> createState() => _MyTabBarState();
// }
//
// class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
//   late TabController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 4, vsync: this);
//     _controller.addListener(() { UpdateImageIndexWidget.of(context)?.updatePage(_controller.index);});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TabBar(
//       controller: _controller,
//       indicator: const ShapeDecoration(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(50))),
//           color: Color(0XFF52B060)),
//       tabs: const [
//         _TabBarItem(
//           text: 'Строительство',
//         ),
//         _TabBarItem(
//           text: 'Отделка',
//         ),
//         _TabBarItem(
//           text: 'Дизайн интерьера',
//         ),
//         _TabBarItem(
//           text: 'Ландшафтный дизайн',
//         ),
//       ],
//     );
//   }
// }
//
// class TabBarScreen2 extends StatefulWidget {
//   final List assets;
//
//   const TabBarScreen2({Key? key, required this.assets}) : super(key: key);
//
//   @override
//   State<TabBarScreen2> createState() => _TabBarScreenState2();
// }
//
// class _TabBarScreenState2 extends State<TabBarScreen2> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: GridView.custom(
//         primary: false,
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: SliverQuiltedGridDelegate(
//           crossAxisCount: 4,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//           repeatPattern: QuiltedGridRepeatPattern.inverted,
//           pattern: [
//             const QuiltedGridTile(2, 2),
//             const QuiltedGridTile(1, 1),
//             const QuiltedGridTile(1, 1),
//             const QuiltedGridTile(1, 2),
//           ],
//         ),
//         childrenDelegate: SliverChildBuilderDelegate((context, index) {
//           return InkWell(
//             onTap: () {
//               UpdateImageIndexWidget.read(context)
//                   ?.result(index, context, widget.assets);
//             },
//             child: ClipRRect(
//               borderRadius: SizeWidget.isSmallScreen(context)
//                   ? BorderRadius.circular(10)
//                   : BorderRadius.circular(20),
//               child: RepaintBoundary(
//                 child: Image.asset(
//                   widget.assets[index],
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         }, childCount: widget.assets.length),
//       ),
//     );
//   }
// }
//
//
// class _TabBarItem extends StatefulWidget {
//   final String text;
//
//   const _TabBarItem({
//     Key? key,
//     required this.text,
//   }) : super(key: key);
//
//   @override
//   State<_TabBarItem> createState() => _TabBarItemState();
// }
//
// class _TabBarItemState extends State<_TabBarItem> {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//       alignment: Alignment.center,
//       height: SizeWidget.isSmallScreen(context) ? 30 : 50,
//       child: Text(
//         widget.text,
//         overflow: TextOverflow.ellipsis,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: Colors.white,
//             fontSize: sizeParam(width, 0.01, 8),
//             fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }