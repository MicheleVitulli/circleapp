import 'package:flutter/material.dart';
import 'package:circleapp/quadrant_circle/quadrant_circle_painter.dart';

class QuadrantGraphWidget extends StatelessWidget {
  final Map<QuadrantType, List<IconData>> items = {
    QuadrantType.one: [IconData(0x43, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(0x46, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(0x42, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(0x45, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(0x47, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(0x43, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(0x46, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(0x42, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(0x45, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(0x41, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(0x44, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(0x47, fontFamily: 'Roboto')],
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          child: CustomPaint(
            painter: QuadrantCirclePainter(dataItems: items),
            size: Size(screenWidth, screenWidth),
          ),
          child: CustomPaint(
            painter: QuadrantCirclePainter(dataItems: smallitems),
          )),
    );
  }
}
