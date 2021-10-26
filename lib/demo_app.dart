import 'dart:math';

import 'package:flutter/material.dart';

class DemoApp extends StatefulWidget {
  DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  bool isFlipped = false;

  Widget firstWidget() {
    return Card(
      key: Key('first'),
      elevation: 5,
      child: Container(
        height: 100,
        width: 250,
        color: Colors.orange.shade300,
        child: FlutterLogo(),
      ),
    );
  }

  Widget secondWidget() {
    return Card(
      key: Key('second'),
      elevation: 5,
      child: Container(
        height: 100,
        width: 250,
        color: Colors.teal.shade200,
        child: Center(
          child: Text(
            'Flip Flip',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget transition(Widget widget, Animation<double> animation) {
    final flipAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
        animation: flipAnimation,
        child: widget,
        builder: (context, widget) {
          final isUnder = (ValueKey(isFlipped) != widget.key);
          final value =
              isUnder ? min(flipAnimation.value, pi / 2) : flipAnimation.value;
          return Transform(
            transform: Matrix4.rotationX(value),
            child: widget,
            alignment: Alignment.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher Demo'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedSwitcher(
              reverseDuration: Duration(seconds: 1),
              duration: Duration(seconds: 1),
              switchInCurve: Curves.ease,
              switchOutCurve: Curves.easeIn,
              child: isFlipped ? firstWidget() : secondWidget(),
              transitionBuilder: transition,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isFlipped = !isFlipped;
                });
              },
              child: Text('Flip'))
        ],
      ),
    );
  }
}
