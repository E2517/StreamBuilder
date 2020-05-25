import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream Builder',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Stream Builder',
      home: ChangeColor(),
    );
  }
}

class ChangeColor extends StatefulWidget {
  @override
  _ChangeColorState createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  final colorStream = new StreamController<Color>();

  int counter = -1;

  final List<Color> colors = [Colors.blue, Colors.red, Colors.yellow];

  @override
  void dispose() {
    colorStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: colorStream.stream,
          builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Click'),
                  SizedBox(height: 20.0),
                  CircularProgressIndicator(),
                ],
              );
            }
            // No working
            // if (snapshot.connectionState == ConnectionState.done) {
            //   Text('Fin');
            // }
            return Container(
              height: 200,
              width: 200,
              color: snapshot.data,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box),
          onPressed: () {
            counter++;
            if (counter < colors.length) {
              colorStream.sink.add(colors[counter]);
            } else {
              colorStream.close();
            }
          }),
    );
  }
}

// Working with swith and case
// class ChangeColor extends StatefulWidget {
//   @override
//   _ChangeColorState createState() => _ChangeColorState();
// }

// class _ChangeColorState extends State<ChangeColor> {
//   final colorStream = new StreamController<Color>();

//   int counter = -1;

//   final List<Color> colors = [Colors.blue, Colors.red, Colors.yellow];

//   @override
//   void dispose() {
//     colorStream.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder(
//           stream: colorStream.stream,
//           builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return Center(child: CircularProgressIndicator());
//                 break;
//               case ConnectionState.active:
//                 return Container(
//                   height: 200,
//                   width: 200,
//                   color: snapshot.data,
//                 );
//                 break;
//               case ConnectionState.done:
//                 return Center(child: Text('Fin'));
//                 break;
//               default:
//                 if (snapshot.hasError) {
//                   return Text('Error has occurred');
//                 } else if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   var result = snapshot.data;
//                   if (result != null) {
//                     return Container(
//                       height: 200,
//                       width: 200,
//                       color: snapshot.data,
//                     );
//                   } else {
//                     return Text('snapshot.data = null');
//                   }
//                 }

//                 break;
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add_box),
//           onPressed: () {
//             counter++;
//             if (counter < colors.length) {
//               colorStream.sink.add(colors[counter]);
//             } else {
//               colorStream.close();
//             }
//           }),
//     );
//   }
// }
