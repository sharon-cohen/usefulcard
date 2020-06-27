import 'package:flutter/material.dart';

import 'package:usefulcard/usefulcard.dart';
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                    child: CardShadow(
                      title: 'Love, Victor',
                      contant: 'Stars: Michael Cimino, Rachel Hilson, Anthony Turpel',
                      image:
                      'https://m.media-amazon.com/images/M/MV5BMmE5Y2RjYjYtOTYyOC00ZDAyLWE1YTItYTQ1ZDZjOWYyMWIwXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_SY500_CR0,0,356,500_AL_.jpg',
                      size: 170,
                    )),
                Container(
                  child: CardShadow(
                    title: 'Space Force ',
                    contant: 'Stars: Steve Carell, John Malkovich, Ben Schwartz ',
                    image:
                    'https://m.media-amazon.com/images/M/MV5BNWYwMzE2MGItOTYwYy00YmQyLWE0NGQtZWViMTU4ZTk4ZjQxXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY500_SX400_AL_.jpg',
                    size:200,
                  ),
                ),
                Container(
                  child: CardShadow(
                    title: '1917',
                    contant: 'Stars: Dean-Charles Chapman, George MacKay, Daniel Mays ',
                    image:
                    'https://m.media-amazon.com/images/M/MV5BOTdmNTFjNDEtNzg0My00ZjkxLTg1ZDAtZTdkMDc2ZmFiNWQ1XkEyXkFqcGdeQXVyNTAzNzgwNTg@._V1_SY500_CR0,0,315,500_AL_.jpg',

                    Details: ['April 6th, 1917. As a regiment assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.','Director: Sam Mendes','Writers: Sam Mendes, Krysty Wilson-Cairns'],
                    size: 400,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

