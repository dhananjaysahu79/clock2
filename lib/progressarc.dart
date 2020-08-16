import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;


class ProgressBar extends StatefulWidget {
  var aqi;
  ProgressBar(this.aqi);

  _ProgressBarState createState(){ return _ProgressBarState(aqi);}
}

class _ProgressBarState extends State<ProgressBar> {
  int aqi;
  _ProgressBarState(this.aqi);
 void initState() {
    __refresh();

  }
   __refresh() async {
   await Future.delayed(const Duration(seconds:2),(){
      setState(() {

      });
   });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
    child: Container(
      height: 360,
      width: 360,
    ),
    painter: RadialPainter(aqi),
    );
  }
}

class RadialPainter extends CustomPainter{
  var aqi;
  RadialPainter(this.aqi);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width/2, size.height/2);

     Paint blurr =Paint()
    ..color=Colors.black.withAlpha(250)
    ..style=PaintingStyle.stroke
    ..strokeWidth=18
    ..maskFilter=MaskFilter.blur(BlurStyle.normal, 12);


   canvas.drawArc(Rect.fromCircle(center:center,radius: size.width/2),
     math.radians(-90),
     math.radians(aqi*3.6),
     false,
     blurr);

    Paint progresspaint=Paint()

    ..shader=LinearGradient(
      stops: [0.0,0.9],
      //F90FDF
      //5F00FF
      colors: [Colors.pink,Color(0xFF5F00FF),]
    ).createShader(Rect.fromCircle(center:center,radius:size.width/2))
    ..style=PaintingStyle.stroke

    ..strokeWidth=22.0;
   canvas.drawArc(
     Rect.fromCircle(center:center,radius: size.width/2),
     math.radians(-90),
     math.radians(aqi*3.6),
     false,
     progresspaint
     );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}