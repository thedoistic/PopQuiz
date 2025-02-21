import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popquiz/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("There are 11 time zones in Russia.", true),
    Question.name("SunFlower is the national flower of Japan.", false),
    Question.name("Istanbul is the capital city of Turkey.", false),
    Question.name("San Marino is the smallest country in the world.", false),
    Question.name("London is the capital city of Canada", false),
    Question.name("There are 51 states in the USA.", true),
    Question.name(
        "The Mariana Trench is the lowest natural place on the Earth.", true),
    Question.name(
        "Scarlet Witch is the most powerful MCU character of all time.", true),
    Question.name("Taylor Swift is the MUSIC INDUSTRY.", true),
    Question.name("Snow White is Disney's first film.", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ready for Pop Quiz!!!"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigo,
      body: Container(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "/Users/edinkoc/StudioProjects/popquiz/assets/images/quiz.jpeg", // Update the path according to your project structure
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Our Questionnnnn....",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 500,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    questionBank[_currentQuestionIndex]
                        .questionText, // Make sure questionBank is defined and contains the required data
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _checkAnswer(true);
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(
                        color: Colors.green.shade100,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "TRUE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _checkAnswer(false);
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(
                        color: Colors.green.shade100,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "False",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      nextQuestion();
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(
                        color: Colors.green.shade100,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white,
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint("Yessss Correct!!!");
    } else {
      debugPrint("Incorrect!");
    }
  }

  nextQuestion() {
    _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
  }
}
