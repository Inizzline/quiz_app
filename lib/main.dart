import 'package:flutter/material.dart';
import 'package:quizzler_app/pages/quiz_page.dart';


void main() => runApp(Quizzler());



class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 135, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('', style: TextStyle(color: Colors.white, fontSize: 15),),
                  Text('BrainzQuiz', style: TextStyle(color: Colors.white, fontSize: 22),),
                  Text('Inizzline v 1.0', style: TextStyle(color: Colors.white, fontSize: 10),),
                ],
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

