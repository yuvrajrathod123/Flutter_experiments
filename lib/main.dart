import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor:Colors.lightBlueAccent,
          title: Text('Experiment No 2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50.0,
              ),
              SizedBox(height: 1.0),
              Image.asset(
                'assets/dbit.jpeg',
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(height: 10.0),
              Text(
                'Hello, Flutter!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'This is an example of Flutter app with icons, images, text, padding, and centering.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
