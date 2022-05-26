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
  final Map<QuadrantType, List<IconData>> arrows = {
    QuadrantType.one: [Icons.arrow_upward_rounded],
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  @override
  Widget _buildBody(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
              child: CustomPaint(
            painter: QuadrantCirclePainter(dataItems: items),
            size: Size(400, 400),
          )),
          Container(
              child: CustomPaint(
            painter: QuadrantCirclePainter2(dataItems: arrows),
            size: Size(200, 226),
          )),
        ],
      ),
    );
  }
}
