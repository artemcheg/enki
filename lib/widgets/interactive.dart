
import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/container_with_best.dart';
import 'package:web_site/widgets/positioned_icon.dart';
import 'package:web_site/widgets/small_changes.dart';

class InterActiveWidget extends StatefulWidget {
  const InterActiveWidget({Key? key}) : super(key: key);

  @override
  _InterActiveWidgetState createState() => _InterActiveWidgetState();
}

class _InterActiveWidgetState extends State<InterActiveWidget> {
  final _isHovering = [false,false];

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      fit: BoxFit.contain,
      child: Stack(
        children: [
          Image.asset(
            'assets/interactive2.jpg',
            width: 1920,
            height: 620,
          ),
          Positioned(
            top: 310,
            left: 990,
            child: InkWell(
              onTap: () {
                setState(() {
                  change(_isHovering, 0);
                });
              },
              child: PositionedIcon(isHovering: _isHovering[0]),
            ),
          ),

          Positioned(
            top: 500,
            left: 990,
            child: InkWell(
              onTap: () {
                setState(() {
                  change(_isHovering, 1);
                });
              },
              child: PositionedIcon(isHovering: _isHovering[1]),
            ),
          ),


          const Positioned(
            top: 30,
            left: 1000,
            child: Text(
              'Почему мы лучшие:',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                shadows: shadowList,
              ),
            ),
          ),

          ContainerWithBest(text: StringRes.bestWindow,show: _isHovering[0],),
          ContainerWithBest(text: StringRes.bestFoundation,show: _isHovering[1],),

        ],
      ),
    );
  }
}

void change(List<bool> isHovering,int index){
  isHovering[index]=!isHovering[index];
  for(int i = 0;i<isHovering.length;i++){
    if(i!=index) {
      isHovering[i] = false;
    }
  }
}