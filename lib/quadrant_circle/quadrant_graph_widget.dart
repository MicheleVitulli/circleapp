// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:circleapp/quadrant_circle/quadrant_circle_painter.dart';

class QuadrantGraphWidget extends StatefulWidget {
  @override
  State<QuadrantGraphWidget> createState() => _QuadrantGraphWidgetState();
}

class _QuadrantGraphWidgetState extends State<QuadrantGraphWidget> {
  static int a = 65;
  static int b = 66;
  static int c = 67;
  static int d = 68;
  static int e = 69;
  static int f = 70;
  static int g = 71;
  static int ab = 55;
  static int bb = 56;
  static int cb = 57;
  static int db = 58;
  static int eb = 59;
  static int fb = 60;
  static int gb = 61;
  static int ax = 45;
  static int bx = 46;
  static int cx = 47;
  static int dx = 48;
  static int ex = 49;
  static int fx = 40;
  static int gx = 41;
  final Map<QuadrantType, List<IconData>> itemsC = {
    QuadrantType.one: [IconData(67, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(70, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(56, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(59, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(55, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(58, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(40, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(66, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(69, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(65, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(68, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(71, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> itemsG = {
    QuadrantType.one: [IconData(g, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(d, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(a, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(e, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(b, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(fx, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(db, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(ab, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(eb, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(bb, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(f, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(c, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> itemsD = {
    QuadrantType.one: [IconData(d, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(a, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(e, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(b, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(fx, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(cx, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(ab, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(eb, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(bb, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(f, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(c, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(g, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> itemsA = {
    QuadrantType.one: [IconData(a, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(e, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(b, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(fx, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(cx, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(gx, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(eb, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(bb, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(f, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(c, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(g, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(d, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> itemsE = {
    QuadrantType.one: [IconData(e, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(b, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(fx, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(cx, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(gx, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(dx, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(bb, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(f, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(c, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(g, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(d, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(a, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> itemsB = {
    QuadrantType.one: [IconData(b, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(fx, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(cx, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(gx, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(dx, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(ax, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(f, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(c, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(g, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(d, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(a, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(e, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> itemsFx = {
    QuadrantType.one: [IconData(g, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(d, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(a, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(e, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(b, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(fx, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(db, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(ab, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(eb, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(bb, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(f, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(c, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> itemsCx = {
    QuadrantType.one: [IconData(g, fontFamily: 'Roboto')],
    QuadrantType.twelve: [IconData(d, fontFamily: 'Roboto')],
    QuadrantType.eleven: [IconData(a, fontFamily: 'Roboto')],
    QuadrantType.ten: [IconData(e, fontFamily: 'Roboto')],
    QuadrantType.nine: [IconData(b, fontFamily: 'Roboto')],
    QuadrantType.eight: [IconData(fx, fontFamily: 'Roboto')],
    QuadrantType.seven: [IconData(db, fontFamily: 'Roboto')],
    QuadrantType.six: [IconData(ab, fontFamily: 'Roboto')],
    QuadrantType.five: [IconData(eb, fontFamily: 'Roboto')],
    QuadrantType.four: [IconData(bb, fontFamily: 'Roboto')],
    QuadrantType.three: [IconData(f, fontFamily: 'Roboto')],
    QuadrantType.two: [IconData(c, fontFamily: 'Roboto')],
  };
  final Map<QuadrantType, List<IconData>> arrows = {};

  String root;

  List rootlist = ['C', 'G', 'D', 'A', 'E', 'B', 'F#'];

  String chord;

  List chordlist = [
    'maj',
    'min',
    '7',
    'min7',
    'maj7',
    'min-maj7',
    '6',
    'min6',
    'dim'
  ];

  final ValueNotifier<String> _currentChord = ValueNotifier<String>('maj');
  final ValueNotifier<String> _currentRoot = ValueNotifier<String>('C');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: FittedBox(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                DropdownButton(
                  hint: const Text('C'),
                  value: root,
                  onChanged: (newRoot) {
                    setState(() {
                      root = newRoot;
                      _currentRoot.value = root;
                    });
                  },
                  items: rootlist.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
                DropdownButton(
                  hint: const Text('maj'),
                  value: chord,
                  onChanged: (newChord) {
                    setState(() {
                      chord = newChord;
                      _currentChord.value = chord;
                    });
                  },
                  items: chordlist.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                )
              ],
            ),
            Container(child: _buildBody(context))
          ],
        ),
        fit: BoxFit.contain,
      )),
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
          if (_currentRoot.value == 'C')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterC(dataItems: itemsC),
              size: Size(400, 400),
            )),
          if (_currentRoot.value == 'G')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterC(dataItems: itemsG),
              size: Size(400, 400),
            )),
          if (_currentRoot.value == 'D')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterC(dataItems: itemsD),
              size: Size(400, 400),
            )),
          if (_currentRoot.value == 'A')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterC(dataItems: itemsA),
              size: Size(400, 400),
            )),
          if (_currentRoot.value == 'E')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterC(dataItems: itemsE),
              size: Size(400, 400),
            )),
          if (_currentRoot.value == 'B')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterC(dataItems: itemsB),
              size: Size(400, 400),
            )),
          if (_currentChord.value == 'maj')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterMaggiore(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == 'min')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterMinore(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == 'dim')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterDiminuito(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == '7')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainter7(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == 'min7')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePaintermin7(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == 'maj7')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePaintermaj7(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == 'min-maj7')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainterminmaj7(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == '6')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePainter6(dataItems: arrows),
              size: Size(200, 200),
            )),
          if (_currentChord.value == 'min6')
            Container(
                child: CustomPaint(
              painter: QuadrantCirclePaintermin6(dataItems: arrows),
              size: Size(200, 200),
            )),
          Container(child: Text('Leggenda'))
        ],
      ),
    );
  }
}
