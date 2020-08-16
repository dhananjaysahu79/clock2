import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
class ClockHand extends StatefulWidget {
  var dark_theme;
  ClockHand(this.dark_theme);
  @override
  _ClockHandState createState() => _ClockHandState(dark_theme);
}

class _ClockHandState extends State<ClockHand> {
 @override
 var dark_theme;
 _ClockHandState(this.dark_theme);
 var hourdeg=0.0;
 var type="AM";
 var mindeg=0.0;
 var secdeg=0;
  void initState() {
    // TODO: implement initState
    super.initState();
    timegetter();
  }
 Future timegetter()async {
   Future.delayed(const Duration(milliseconds: 500),(){
   setState(() {
  var hourformat=DateFormat('kk');
  var hour=int.parse(hourformat.format(DateTime.now()));
  var minformat=DateFormat('mm');
  var min=int.parse(minformat.format(DateTime.now()));
  var secformat=DateFormat('ss');
  var sec=int.parse(secformat.format(DateTime.now()));
  secdeg=sec*6;
  if(hour>12){
    hour=hour-12;
    type="PM";
  }
   hourdeg=(hour*30)+(min/2);
   mindeg=min*6+sec/10;

  });
  timegetter();
   });


}


  @override
  Widget build(BuildContext context) {
    return Container(
       height: 350,
       width: 350,
       child: Stack(
         alignment:AlignmentDirectional.center,
         children: <Widget>[
            Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(58.0),
                 child: Text("$type",
                 style:TextStyle(
                   color:Colors.grey.withOpacity(0.8),
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )

                 ),
               )
             ],
         ),
         //hour_hand
          SizedBox(
            child:Transform.rotate(
              angle: (3.14/180)*hourdeg,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, -32),
                child: Container(
                height: 60,
                width: 5,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: Colors.deepPurple
                    )
                ),
                ),
           )
          ),

          //min_hand
          SizedBox(
            child:Transform.rotate(
              angle: (3.14/180)*mindeg,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, -36),
                child: Container(
                height: 120,
                width: 4,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color:Colors.deepPurple,
                    )
                ),
                ),
           )
          ),

          //sec_hand
          SizedBox(
            child:Transform.rotate(
              angle: (3.14/180)*secdeg,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, -85),
                child: Container(
                height: 220,
                width: 3,
                  decoration:BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(7.5),
                    )
                ),
                ),
           )
          ),
          //center_pin
           Container(
             height:18,
             decoration:BoxDecoration(
               color:Colors.black,
               shape:BoxShape.circle
             ),
             child: Padding(
               padding: const EdgeInsets.all(5.0),
               child: Container(
                 decoration: BoxDecoration(
                   color:Colors.cyan,
                   shape:BoxShape.circle
                 ),
               ),
             ),
           ),
         ],
       ),
    );
  }
}

