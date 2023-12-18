import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String clickMessage = '';

  void handleClick() {
    setState(() {
      clickMessage = 'Mouse Clicked!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigation Rail',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                // Handle mouse enter event
                print('Mouse Entered!');
              },
              child: GestureDetector(
                onTap: () {
                  // Handle tap event
                  print('Tapped!');
                  handleClick();
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.green,
                  child: Text(
                    'Click Me!',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            if (clickMessage.isNotEmpty)
              Text(
                clickMessage,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
