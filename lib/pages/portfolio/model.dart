
import 'package:flutter/material.dart';

class ImageDialog extends StatefulWidget {
  final int index;
  final List assets;

  const ImageDialog({
    Key? key,
    required this.index,
    required this.assets,
  }) : super(key: key);

  @override
  State<ImageDialog> createState() => ImageDialogState();
}

class ImageDialogState extends State<ImageDialog> {
  bool previous = false;
  bool next = false;
  bool close = false;
  late int indexMy;

  @override
  void initState() {
    super.initState();

    indexMy = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return RepaintBoundary(
      child: InteractiveViewer(
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Dialog(
                backgroundColor: Colors.black.withOpacity(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: AnimatedSwitcher(
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                          opacity: animation,
                          child:
                          ScaleTransition(scale: animation, child: child));
                    },
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      widget.assets[indexMy],
                      key: ValueKey(indexMy),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 25,
                top: 20,
                child: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  onHover: (value) {
                    setState(() {
                      close = value;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: close ? const Color(0XFF52B060) : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                     padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 8),
                      child: Icon(
                        Icons.close_rounded,
                        size: width*0.03,
                        color: close ? const Color(0XFF52B060) : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 100,
                child: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      if (indexMy < widget.assets.length - 1) {
                        indexMy++;
                      } else {
                        indexMy = 0;
                      }
                    });
                  },
                  onHover: (value) {
                    setState(() {
                      next = value;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: next ? const Color(0XFF52B060) : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 8),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: width*0.03,
                        color: next ? const Color(0XFF52B060) : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                bottom: 50,
                child: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      if (indexMy > 0) {
                        indexMy--;
                      } else {
                        indexMy = widget.assets.length - 1;
                      }
                    });
                  },
                  onHover: (value) {
                    setState(() {
                      previous = value;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color:
                          previous ? const Color(0XFF52B060) : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 8),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: width*0.03,
                        color: previous ? const Color(0XFF52B060) : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateImageIndexWidget extends InheritedNotifier<ImageModel> {
  final ImageModel model;

  const UpdateImageIndexWidget({
    required this.model,
    Key? key,
    required Widget child,
  }) : super(key: key,notifier: model, child: child);

  static ImageModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UpdateImageIndexWidget>()?.notifier;
  }

  static ImageModel? read(BuildContext context) {

    final widget = context.getElementForInheritedWidgetOfExactType<UpdateImageIndexWidget>()?.widget;
    return widget is UpdateImageIndexWidget ? widget.notifier:null;
  }

  @override
  bool updateShouldNotify(UpdateImageIndexWidget oldWidget) {
    return model != oldWidget.model;
  }
}

class ImageModel extends ChangeNotifier {
  int? index;
  List? assets;
  int page = 0;

  void result(int index, BuildContext context, List assets) {
    this.index = index;
    this.assets = assets;
    showDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return ImageDialog(
            assets: assets,
            index: index,
          );
        });
    notifyListeners();
  }

}