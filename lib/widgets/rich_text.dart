import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyRichText extends StatefulWidget {
  bool isHovering;
  final String text;
  final String what;
  final dynamic sizeParam;
  final String webOnlyWindowName;
  final Color colorText;
  final List<Shadow>? shadow;
  final String ?fontFamily;
  final int maxLines;

  MyRichText(
      {Key? key,
      required this.isHovering,
      required this.text,
      required this.sizeParam,
      required this.what, this.webOnlyWindowName="_self", this.colorText = Colors.white, this.shadow, this.fontFamily='Comfortaa', this.maxLines=1,})
      : super(key: key);

  @override
  _MyRichTextState createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.grey.withOpacity(0),
      onHover: (value) {
        setState(() {
          widget.isHovering = value;
        });
      },
      onTap: () {},
      child: SelectableText.rich(
        TextSpan(
            text: widget.text,
            style: TextStyle(
              fontFamily: widget.fontFamily,
                color:
                    widget.isHovering ? const Color(0XFF52B060) :widget.colorText,
                fontSize: widget.sizeParam,
            shadows: widget.shadow),
            mouseCursor: SystemMouseCursors.click,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                launch(widget.what,
                    webOnlyWindowName: widget.webOnlyWindowName
                );
              }),
        toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
        cursorColor: Colors.red,
        showCursor: true,
        maxLines: widget.maxLines,
      ),
    );
  }
}
