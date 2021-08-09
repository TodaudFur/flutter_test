import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Color(0XFF64B5F6);
  double position = 0;
  late Timer _timer;
  int _time = 1000;
  bool ch = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _timer = Timer.periodic(Duration(milliseconds: _time), (timer) {
      setState(() {
        if (ch) {
          position++;
        } else {
          position--;
        }
        if (position ==
            MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width / 8) {
          ch = false;
        } else if (position == 0) {
          ch = true;
        }
      });
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    left: position,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 8,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _time = 500;
                    });
                  },
                  child: Text("X0.5"),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _time = 1000;
                    });
                  },
                  child: Text("X1"),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _time = 2000;
                    });
                  },
                  child: Text("X2"),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalDivider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = Color(0XFF64B5F6);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 8,
                    color: Colors.blue[300],
                  ),
                ),
                VerticalDivider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = Color(0XFF81C784);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 8,
                    color: Colors.green[300],
                  ),
                ),
                VerticalDivider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = Color(0XFFBA68C8);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 8,
                    color: Colors.purple[300],
                  ),
                ),
                VerticalDivider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = Color(0XFFFFB74D);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 8,
                    color: Colors.orange[300],
                  ),
                ),
                VerticalDivider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = Color(0XFFE57373);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 8,
                    color: Colors.red[300],
                  ),
                ),
                VerticalDivider(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
