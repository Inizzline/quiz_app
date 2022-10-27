
import 'package:quizzler_app/pages/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBox = [
    Question(q: 'The amalgamation of Nigeria was in 1914', a: true),
    Question(q: 'Dart is an object oriented programming language', a: true),
    Question(q: 'Is this the correct spelling of the word NUEMONIA', a: false),
    Question(q: 'The human body is made up of 206 bones', a: true),
    Question(q: 'About 71% of the earth\'s surface is covered with water', a: true),
    Question(q: 'The country Nigeria consists of 774 local government areas', a: true),
    Question(q: 'Water consists of two molecules, nitrogen and oxygen', a: false),
    Question(q: 'RNA stands for Ricocromatic Nucleic Acid', a: false),
    Question(q: 'The temperature of the sun is 9,000 degrees celsius', a: false),
    Question(q: 'Mazi Alvan Ikoku is the face of the two hundred Nigerian naira note  ', a: false),
    Question(q: 'Fish is a major source of protein', a: true),

  ];

  void nextQuestion() {
    if (_questionNumber < _questionBox.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBox[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBox[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBox.length -1) {
      return true;
    } else {
      return false;
    }
  }
  void reset() { //This reset method return the question back to the first question in the questionBox
    _questionNumber = 0;
  }
}