import 'package:flutter/material.dart';
import 'package:flutter_animatedswitcher_demo/demo_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}


// import 'dart:math';

// import 'package:flutter/material.dart';

// class DemoApp extends StatefulWidget {
//   DemoApp({Key key}) : super(key: key);

//   @override
//   _DemoAppState createState() => _DemoAppState();
// }

// class _DemoAppState extends State<DemoApp> {
//   bool isFlipped = false;

//   Widget firstWidget() {
//     return Card(
//       key: Key('first'),
//       elevation: 10,
//       child: Container(
//         height: 100,
//         width: 300,
//         color: Colors.red,
//         child: Text('hey'),
//       ),
//     );
//   }

//   Widget secondWidget() {
//     return Card(
//       key: Key('second'),
//       elevation: 10,
//       child: Container(
//         height: 100,
//         width: 300,
//         color: Colors.teal,
//         child: FlutterLogo(),
//       ),
//     );
//   }

//   Widget transition(Widget widget, Animation<double> animation) {
//     final filpAnimation = Tween(begin: pi, end: 0.0).animate(animation);
//     return AnimatedBuilder(
//         animation: filpAnimation,
//         child: widget,
//         builder: (context, widget) {
//           final isUnder = (ValueKey(isFlipped) != widget.key);
//           final value =
//               isUnder ? min(filpAnimation.value, pi / 2) : filpAnimation.value;

//           return Transform(
//             transform: Matrix4.rotationX(value),
//             child: widget,
//             alignment: Alignment.center,
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AnimatedSwitcher Demo'),
//         backgroundColor: Colors.lightGreen,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: AnimatedSwitcher(
//               transitionBuilder: transition,
//               duration: Duration(seconds: 1),
//               reverseDuration: Duration(seconds: 1),
//               child: isFlipped ? firstWidget() : secondWidget(),
//               switchInCurve: Curves.ease,
//               switchOutCurve: Curves.easeIn,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   isFlipped = !isFlipped;
//                 });
//               },
//               child: Text('Flip'))
//         ],
//       ),
//     );
//   }
// }
