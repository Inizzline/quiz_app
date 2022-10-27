import 'package:flutter/material.dart';
import 'package:quizzler_app/pages/questionpage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:math';




class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  QuizBrain quizBrain = QuizBrain();



  List<Icon> scoreKeeper = [];

  int totalCorrect = 0;
  int totalQuestion = 0;


  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {


      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'FINISHED!, Give the developer Inizzline a like 👍',
          desc: 'You scored $totalCorrect/$totalQuestion',
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              child: Text('PLAY AGAIN', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),),
            )
          ]

        ).show();

        quizBrain.reset(); //This resets the questions to the beginning

        scoreKeeper.clear();
        totalCorrect = 0;
        totalQuestion = 0;
      }
      else {
        if (correctAnswer == userPickedAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
          totalCorrect++;
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
        }
        totalQuestion++;
        // This triggers a re-build in the button pressed and let's us know what number we are on
        quizBrain.nextQuestion(); //This increases the question number by one one each button pressed
      } });
  }

  // List<String> questions = [
  //   'The amalgamation of Nigeria was in 1914',
  //   'Dart is an object oriented programming language',
  //   'Is this the correct spelling if the word NUEMONIA',
  //   'The human body is made up of 206 bones',
  //   'The current state capital of Nigeria is Lagos'
  // ];
  //
  // List<bool> answers = [
  //   true,
  //   true,
  //   false,
  //   true,
  //   false,
  // ];


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[900]
                ),
                child: Center(
                  child: Text(quizBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)
                ),
                onPressed: () {
                  //This will display the answer when the user presses the TRUE button,
                  checkAnswer(true);
                },
                child: Text('True', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
              ),
              onPressed: () {
                //This will display the answer when the user presses the FALSE button,
                checkAnswer(false);
              },
              child: Text('False', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
