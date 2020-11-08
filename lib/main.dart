import 'package:flutter/material.dart';
import 'Model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCQS APP',
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var counter = 0;

  List qList = [
    Questions("1.The human body has four lungs.", false),
    Questions("2.Kelvin is a measure of temperature.", true),
    Questions("3.The Atlantic Ocean is the biggest ocean on Earth.", false),
    Questions("4.Sharks are mammals.", false),
    Questions("5.The human skeleton is made up of less than 100 bones.", false),
    Questions("6.Atomic bombs work by atomic fission.", true),
    Questions("7.Molecules are chemically bonded.", true),
    Questions("8.Spiders have six legs.", false),
    Questions(
        "9.Mount Kilimanjaro is the tallest mountain in the world.", false),
    Questions("10.The study of plants is known as botany.", true),
  ];

  var score = 0;
  int max = 50;
  checkWin(bool userChoice, BuildContext context) {
    if (userChoice == qList[counter].isCorrect) {
      print("correct");
      score = score + 5;
      if (score > max) {
        score = 0;
      }
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct Answer!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      print("false");
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Wrong Answer!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (counter < 9) {
        counter = counter + 1;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'MCQS App',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF4F3E3),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/shakeeb.png"),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Score : $score /50",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                            letterSpacing: 5.0),
                      ),
                      onTap: reset,
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Color(0xFFF7C229))),
                height: 90.0,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FittedBox(
                      child: Text(qList[counter].qText,
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => checkWin(true, context),
                    padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 30.0),
                    child: Text(
                      "TRUE",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0),
                    ),
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)),
                  ),
                  RaisedButton(
                    onPressed: () => checkWin(false, context),
                    padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 30.0),
                    child: Text(
                      "FALSE",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0),
                    ),
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
