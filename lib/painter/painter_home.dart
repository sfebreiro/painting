import 'package:flutter/material.dart';
import 'package:fingerpaint/painter/drawing.dart';

class PainterHome extends StatefulWidget {
  @override
  _PainterHomeState createState() => _PainterHomeState();
}

class _PainterHomeState extends State<PainterHome> {
  List<FingerPoints> points = [];

  Color selectedColor = Colors.deepPurpleAccent;
  StrokeCap strokeType = StrokeCap.round;
  double strokeWidth = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onPanStart: (details) {
                  setState(
                    () {
                      RenderBox renderBox = context.findRenderObject();
                      points.add(
                        FingerPoints(
                          points:
                              renderBox.globalToLocal(details.globalPosition),
                          paint: Paint()
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth
                            ..strokeCap = strokeType,
                        ),
                      );
                    },
                  );
                },
                onPanUpdate: (details) {
                  setState(
                    () {
                      RenderBox renderBox = context.findRenderObject();
                      points.add(
                        FingerPoints(
                          points:
                              renderBox.globalToLocal(details.globalPosition),
                          paint: Paint()
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth
                            ..strokeCap = strokeType,
                        ),
                      );
                    },
                  );
                },
                onPanEnd: (details) {
                  setState(
                    () {
                      points.add(null);
                    },
                  );
                },
                child: CustomPaint(
                  painter: Drawing(
                    pointsList: points,
                  ),
                  size: Size.infinite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      child: Icon(Icons.clear),
                      onPressed: () => points.clear()),
                  FloatingActionButton(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    child: Icon(Icons.create),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          elevation: 1.0,
                          actionsPadding:
                              EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          actions: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.brush,
                                    size: 24.0,
                                    color: strokeWidth == 2.0
                                        ? Colors.black54
                                        : Colors.black87,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      strokeWidth = 2.0;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.brush,
                                    size: 28.0,
                                    color: strokeWidth == 4.0
                                        ? Colors.black54
                                        : Colors.black87,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      strokeWidth = 4.0;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.brush,
                                    size: 34.0,
                                    color: strokeWidth == 6.0
                                        ? Colors.black54
                                        : Colors.black87,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      strokeWidth = 6.0;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: selectColor(Colors.red),
                                ),
                                Container(
                                  child: selectColor(Colors.yellow),
                                ),
                                Container(
                                  child: selectColor(Colors.green),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: selectColor(Colors.blue),
                                ),
                                Container(
                                  child: selectColor(Colors.purple),
                                ),
                                Container(
                                  child: selectColor(Colors.brown),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: selectColor(Colors.orange),
                                ),
                                Container(
                                  child: selectColor(Colors.cyan),
                                ),
                                Container(
                                  child: selectColor(Colors.pink),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: selectColor(Colors.amber),
                                ),
                                Container(
                                  child: selectColor(Colors.indigo),
                                ),
                                Container(
                                  child: selectColor(Colors.black87),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectColor(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
          Navigator.of(context).pop();
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 26,
          width: 26,
          color: selectedColor == color ? color.withOpacity(0.3) : color,
        ),
      ),
    );
  }
}
