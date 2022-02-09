import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_site/widgets/small_changes.dart';

class MyRichText extends StatefulWidget {
  bool isHovering;
  final String text;
  final String what;
  final dynamic sizeParam;
  final String webOnlyWindowName;

  MyRichText(
      {Key? key,
      required this.isHovering,
      required this.text,
      required this.sizeParam,
      required this.what, this.webOnlyWindowName="_self",})
      : super(key: key);

  @override
  _MyRichTextState createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                color:
                    widget.isHovering ? const Color(0XFF52B060) : Colors.white,
                fontSize: widget.sizeParam,
            shadows: shadowList),
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
      ),
    );
  }
}
