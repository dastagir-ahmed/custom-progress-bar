import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math' as math;

import 'package:percent_indicator/linear_percent_indicator.dart';
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Custom Progress Bar"),
            backgroundColor: Colors.redAccent
        ),
        body: Column(
          children: [

          Container(
            child: Stack(
              children: [
                Opacity(opacity: 0.5,
                child: ClipPath(
                  clipper:WaveClipper(),
                  child: Container(
                    color:Colors.deepOrangeAccent,
                    height: 200,
                  ),
                ),
                ),
                ClipPath(
                  clipper:WaveClipper(),
                  child: Container(
                    color:Colors.red,
                    height: 180,
                    alignment: Alignment.center,

                  ),
                ),
              ],
            ),
          ),
           
          ],
        ),
    );
  }
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom
    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy,
        firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24),
        size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy,
        secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
