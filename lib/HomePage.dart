import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage rupee = AssetImage("images/rupee.png");
  AssetImage sadFace = AssetImage("images/sadFace.png");

  List<String> itemArray;
  int luckynumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckynumber = random;
    });
  }

  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return rupee;
        break;
      case "unlucky":
        return sadFace;
        break;
    }
    return circle;
  }

  playGame(int index) {
    if (luckynumber == index) {
      setState(() {
        itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
  }

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckynumber] = "lucky";
    });
  }

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch and win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        this.playGame(i);
                      },
                      child: Image(
                        image: this.getImage(i),
                      ),
                    ),
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(
              onPressed: () {
                this.showAll();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Show All',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(
              onPressed: () {
                this.resetGame();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '                          A.k infotech              ',
              style: TextStyle(fontSize: 18.0, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
