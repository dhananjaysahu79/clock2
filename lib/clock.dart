import 'package:flutter/material.dart';
import 'hands.dart';
import 'package:clock/progressarc.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dark_theme=false;
  themeChanger(){
    setState(() {
      print("called");
      dark_theme= !dark_theme;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: dark_theme?Brightness.light:Brightness.dark),
    child: Scaffold(
      backgroundColor: (dark_theme)?Color(0xFF262B41):Colors.white.withOpacity(0.9),
      body: Column(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Stack(
               alignment: AlignmentDirectional.center,
               children: <Widget>[
                ProgressBar(70),
                 Container(
                   height:MediaQuery.of(context).size.height/2.6,
                   width:MediaQuery.of(context).size.height/2.6,
                   decoration: BoxDecoration(
                     shape:BoxShape.circle,
                     boxShadow: [
                       BoxShadow(
                         color:dark_theme==true?Colors.white.withOpacity(0.1):Colors.white,
                         offset:Offset(-2.0,-1.0),
                         blurRadius: 8.0,
                         spreadRadius: 2
                       ),
                       BoxShadow(
                         color:Colors.black.withOpacity(0.3),
                         offset:Offset(9.0,9.5),
                         blurRadius: 12.0,
                       )
                     ],

                   color: (dark_theme==true)?Color(0xFF262B41):Colors.grey[300],
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Stack(
                       alignment: Alignment.center,
                       children: <Widget>[
                         Container(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [
                                 Colors.transparent,
                                 Colors.transparent,
                                 Colors.transparent,
                                 dark_theme==true?Colors.black.withOpacity(0.7):Colors.black.withOpacity(0.2),
                              ],
                              center: AlignmentDirectional(0.1,0.1),
                              focal:AlignmentDirectional(0.0,0.0),
                              radius: 0.65,

                              ),
                            shape: BoxShape.circle,
                            color:(dark_theme==true)?Color(0xFF262B41):Colors.grey[300],
                          ),

                            ),

                            InkWell(
                              onDoubleTap: themeChanger,
                                child: Container(
                                 decoration: BoxDecoration(
                                gradient: RadialGradient(
                                colors: [
                                   Colors.transparent,
                                   Colors.transparent,
                                   Colors.transparent,
                                   Colors.transparent,
                                   Colors.transparent,
                                   dark_theme==true?Colors.black.withOpacity(0.07):Colors.white.withOpacity(0),
                                   dark_theme==true?Colors.white.withOpacity(0.5):Colors.white,
                                ],
                                center: dark_theme==true?AlignmentDirectional(-0.1,-0.1):AlignmentDirectional(-0.1,-0.1),
                                focal:AlignmentDirectional(0.0,0.0),
                                radius: 0.6,
                                ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("Assets/Images/clock.png")
                                ),
                              shape: BoxShape.circle,
                              color:(dark_theme==true)?Color(0xFF262B41):Colors.grey[300],
                          ),
                          child: ClockHand(dark_theme),
                              ),
                            ),
                       ],
                     ),
                   ),

                 ),
               ],
             ),
           ],
         ),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text("Neumorphic Clock",
               style:TextStyle(
                 color:(dark_theme==true)?Colors.white:Colors.black,
                 fontSize: 30,
                 fontWeight: FontWeight.bold
                 )

               )
             ],
         ),
         Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text("DoubleTap the Clock For Dark Mode",
               style:TextStyle(
                 color:(dark_theme==true)?Colors.white54:Colors.black,
                 fontSize: 14,
                 fontWeight: FontWeight.bold
                 )
               )
             ],
         ),
       ],
      ),
    )
    );
  }
}