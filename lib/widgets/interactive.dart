import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/container_with_best.dart';
import 'package:web_site/widgets/small_changes.dart';

class InterActiveWidget extends StatefulWidget {
  const InterActiveWidget({Key? key}) : super(key: key);

  @override
  _InterActiveWidgetState createState() => _InterActiveWidgetState();
}

class _InterActiveWidgetState extends State<InterActiveWidget> {

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      fit: BoxFit.contain,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {  if(SizeWidget.isSmallScreen(context)){return const StackSmall();}else{return const StackLarge();}},

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

void changeHover(List<bool> isHovering,int index,bool value){
  isHovering[index]=true;
  for(int i = 0;i<isHovering.length;i++){
    if(i!=index) {
      isHovering[i] = false;
    }
  }
}

class StackLarge extends StatefulWidget {
  const StackLarge({Key? key}) : super(key: key);

  @override
  _StackLargeState createState() => _StackLargeState();
}

class _StackLargeState extends State<StackLarge> {
  final _isHovering = [true,false];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/interactive.jpg',
          width: 1919,
          height: 738,
        ),
        Positioned(
          top: 290,
          left: 990,
          child: InkWell(
            onTap: (){},
            onHover: (value){setState(() {
              changeHover(_isHovering, 0, value);
            });},
            child: PositionedIcon(isHovering: _isHovering[0]),
          ),
        ),

        Positioned(
          top: 650,
          left: 1200,
          child: InkWell(
            onTap: (){},
            onHover: (value){setState(() {
              changeHover(_isHovering, 1, value);
            });},
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

        ContainerWithBest(text: StringRes.bestWindow,show: _isHovering[0],height: 736,),
        ContainerWithBest(text: StringRes.bestFoundation,show: _isHovering[1],height: 736,),

      ],
    );
  }
}


class StackSmall extends StatefulWidget {
  const StackSmall({Key? key}) : super(key: key);

  @override
  _StackSmallState createState() => _StackSmallState();
}

class _StackSmallState extends State<StackSmall> {
  final _isHovering = [true,false];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/interactive3.jpg',
              width: 1084,
              height: 582,
            ),
            Positioned(
              top: 140,
              left: 220,
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
              left: 250,
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
              top: 10,
              left: 10,
              child: Text(
                'Почему мы лучшие:',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  shadows: shadowList,
                ),
              ),
            ),



          ],
        ),
        ContainerWithBestSmall(text: StringRes.bestWindow,show: _isHovering[0],height:600 ,),
        ContainerWithBestSmall(text: StringRes.bestFoundation,show: _isHovering[1],height:600,),
      ],
    );
  }
}
