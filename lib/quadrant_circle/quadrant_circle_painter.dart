import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

enum QuadrantType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  eleven,
  twelve
}

class QuadrantCirclePainterC extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.red;
  static const Color twoQuadrantColor = Colors.blue;
  static const Color threeQuadrantColor = Colors.red;
  static const Color fourQuadrantColor = Colors.blue;
  static const Color fiveQuadrantColor = Colors.red;
  static const Color sixQuadrantColor = Colors.blue;
  static const Color sevenQuadrantColor = Colors.red;
  static const Color eightQuadrantColor = Colors.blue;
  static const Color nineQuadrantColor = Colors.red;
  static const Color tenQuadrantColor = Colors.blue;
  static const Color elevenQuadrantColor = Colors.red;
  static const Color twelveQuadrantColor = Colors.blue;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.transparent;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainterC({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 10, 20);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 80, 40);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 133, 95);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 153, 160);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 133, 230);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 80, 280);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 10, 300);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 60, 280);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 230);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 160);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 95);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 60, 40);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = true,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    String notetext;
    if (iconData.codePoint.toString() == '65') (notetext = 'A');
    if (iconData.codePoint.toString() == '66') (notetext = 'B');
    if (iconData.codePoint.toString() == '67') (notetext = 'C');
    if (iconData.codePoint.toString() == '68') (notetext = 'D');
    if (iconData.codePoint.toString() == '69') (notetext = 'E');
    if (iconData.codePoint.toString() == '70') (notetext = 'F');
    if (iconData.codePoint.toString() == '71') (notetext = 'G');
    if (iconData.codePoint.toString() == '55') (notetext = 'Ab');
    if (iconData.codePoint.toString() == '56') (notetext = 'Bb');
    if (iconData.codePoint.toString() == '57') (notetext = 'Cb');
    if (iconData.codePoint.toString() == '58') (notetext = 'Db');
    if (iconData.codePoint.toString() == '59') (notetext = 'Eb');
    if (iconData.codePoint.toString() == '60') (notetext = 'Fb');
    if (iconData.codePoint.toString() == '61') (notetext = 'Gb');
    if (iconData.codePoint.toString() == '45') (notetext = '#A');
    if (iconData.codePoint.toString() == '46') (notetext = '#B');
    if (iconData.codePoint.toString() == '47') (notetext = '#C');
    if (iconData.codePoint.toString() == '48') (notetext = '#D');
    if (iconData.codePoint.toString() == '49') (notetext = '#E');
    if (iconData.codePoint.toString() == '40') (notetext = '#F');
    if (iconData.codePoint.toString() == '41') (notetext = '#G');

    textPainter.text = TextSpan(
        text: notetext,
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainterMaggiore extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainterMaggiore({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainterMinore extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainterMinore({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainterDiminuito extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.yellow;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.white;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainterDiminuito({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainter7 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainter7({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 20, 80);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermin7 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermin7({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermaj7 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.green;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermaj7({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainterminmaj7 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.green;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainterminmaj7({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainter6 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.deepOrange;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainter6({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermin6 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.deepOrange;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermin6({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainter69 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.deepOrange;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainter69({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainter9 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainter9({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermin9 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermin9({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermaj9 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.green;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermaj9({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainter11 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.purple;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainter11({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermin11 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.purple;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermin11({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainter13 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.purple;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.deepOrange;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainter13({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermin13 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.purple;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.deepOrange;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermin13({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermaj13 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.purple;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.green;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.deepOrange;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermaj13({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainteradd9 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.indigo;
  static const Color twelveQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainteradd9({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainter75 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.yellow;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.white;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainter75({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainteraug7 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.yellow;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.white;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainteraug7({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainterdim7 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.yellow;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.green;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.white;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainterdim7({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePaintermin7b5 extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.green;
  static const Color fourQuadrantColor = Colors.yellow;
  static const Color fiveQuadrantColor = Colors.white;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.yellow;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.white;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.white;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePaintermin7b5({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class QuadrantCirclePainteraug extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 48;
  static const double centerCircleIconSize = 48;

  static const Color oneQuadrantColor = Colors.yellow;
  static const Color twoQuadrantColor = Colors.white;
  static const Color threeQuadrantColor = Colors.white;
  static const Color fourQuadrantColor = Colors.white;
  static const Color fiveQuadrantColor = Colors.yellow;
  static const Color sixQuadrantColor = Colors.white;
  static const Color sevenQuadrantColor = Colors.white;
  static const Color eightQuadrantColor = Colors.white;
  static const Color nineQuadrantColor = Colors.yellow;
  static const Color tenQuadrantColor = Colors.white;
  static const Color elevenQuadrantColor = Colors.white;
  static const Color twelveQuadrantColor = Colors.white;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.green;
  static const Color dataItemIconColor = Colors.black;

  /// Angle variables
  final double one = (3 * math.pi / 2) - (math.pi / 12);
  final double two = (3 * math.pi / 2) - (math.pi / 6) - (math.pi / 12);
  final double three = (3 * math.pi / 2) - 2 * (math.pi / 6) - (math.pi / 12);
  final double four = (3 * math.pi / 2) - 3 * (math.pi / 6) - (math.pi / 12);
  final double five = (3 * math.pi / 2) - 4 * (math.pi / 6) - (math.pi / 12);
  final double six = (3 * math.pi / 2) - 5 * (math.pi / 6) - (math.pi / 12);
  final double seven = (3 * math.pi / 2) - 6 * (math.pi / 6) - (math.pi / 12);
  final double eight = (3 * math.pi / 2) - 7 * (math.pi / 6) - (math.pi / 12);
  final double nine = (3 * math.pi / 2) - 8 * (math.pi / 6) - (math.pi / 12);
  final double ten = (3 * math.pi / 2) - 9 * (math.pi / 6) - (math.pi / 12);
  final double eleven = (3 * math.pi / 2) - 10 * (math.pi / 6) - (math.pi / 12);
  final double twelve = (3 * math.pi / 2) - 11 * (math.pi / 6) - (math.pi / 12);
  final double quarterAngle = math.pi / 6; // 1 quadrant = 30 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;

  QuadrantCirclePainteraug({
    @required this.dataItems,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    /// DRAW QUADRANTS
    /// Top Right Quarter
    canvas.drawArc(arcsRect, one, quarterAngle, useCenter,
        paint..color = oneQuadrantColor);
    canvas.drawArc(arcsRect, two, quarterAngle, useCenter,
        paint..color = twoQuadrantColor);
    canvas.drawArc(arcsRect, three, quarterAngle, useCenter,
        paint..color = threeQuadrantColor);
    canvas.drawArc(arcsRect, four, quarterAngle, useCenter,
        paint..color = fourQuadrantColor);
    canvas.drawArc(arcsRect, five, quarterAngle, useCenter,
        paint..color = fiveQuadrantColor);
    canvas.drawArc(arcsRect, six, quarterAngle, useCenter,
        paint..color = sixQuadrantColor);
    canvas.drawArc(arcsRect, seven, quarterAngle, useCenter,
        paint..color = sevenQuadrantColor);
    canvas.drawArc(arcsRect, eight, quarterAngle, useCenter,
        paint..color = eightQuadrantColor);
    canvas.drawArc(arcsRect, nine, quarterAngle, useCenter,
        paint..color = nineQuadrantColor);
    canvas.drawArc(arcsRect, ten, quarterAngle, useCenter,
        paint..color = tenQuadrantColor);
    canvas.drawArc(arcsRect, eleven, quarterAngle, useCenter,
        paint..color = elevenQuadrantColor);
    canvas.drawArc(arcsRect, twelve, quarterAngle, useCenter,
        paint..color = twelveQuadrantColor);

    /// Bottom Right Quarter

    /// DRAW CENTER CIRCLE
    /*Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = centerCircleColor);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );*/

    /// DRAW ITEMS in all quadrant bounds
    for (QuadrantType quadrantType in QuadrantType.values) {
      populateQuadrantItems(
        canvas,
        quadrantType,
        outerRadius,
        rectSideInsideQuadrant,
        centerCircleDiameter / 2,
      );
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      /*case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      */
      case QuadrantType.one:
        offset = Offset(quadrantRadius - 24, 1);
        break;
      case QuadrantType.two:
        offset = Offset(quadrantRadius - 95, 35);
        break;
      case QuadrantType.three:
        offset = Offset(quadrantRadius - 150, 88);
        break;
      case QuadrantType.four:
        offset = Offset(quadrantRadius - 170, 165);
        break;
      case QuadrantType.five:
        offset = Offset(quadrantRadius - 150, 242);
        break;
      case QuadrantType.six:
        offset = Offset(quadrantRadius - 95, 295);
        break;
      case QuadrantType.seven:
        offset = Offset(quadrantRadius - 24, 322);
        break;
      case QuadrantType.eight:
        offset = Offset(quadrantRadius + 58, 295);
        break;
      case QuadrantType.nine:
        offset = Offset(quadrantRadius + 113, 242);
        break;
      case QuadrantType.ten:
        offset = Offset(quadrantRadius + 133, 165);
        break;
      case QuadrantType.eleven:
        offset = Offset(quadrantRadius + 113, 88);
        break;
      case QuadrantType.twelve:
        offset = Offset(quadrantRadius + 58, 35);
        break;

      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, 1); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
