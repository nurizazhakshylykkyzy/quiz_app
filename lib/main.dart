import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'quiz_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon correctIcon = const Icon(
    Icons.check,
    color: Colors.green,
    size: 40,
  );
  Icon incorrectIcon = const Icon(
    Icons.close,
    color: Colors.red,
    size: 40,
  );

  List<Icon> icons = <Icon>[];
  String suroo;

  @override
  void initState() {
    suroo = quizBrain.getQuestions(); 
    super.initState();
  }

  bool isFinished = false;
  void userAnswered(bool answer) {
    bool realAnswers = quizBrain.getAnswer();
    if (answer == realAnswers) {
      icons.add(correctIcon);
    } else {
      icons.add(incorrectIcon);
    }
    quizBrain.getNext();
    suroo = quizBrain.getQuestions();
    if (suroo == 'Surolor buttu') {
      isFinished = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isFinished == true)
              CustomButton(
                color: Colors.red,
                text: 'Ayagina chikty',
                onPressed: () {
                  quizBrain.restart();
                  quizBrain.getQuestions();
                  isFinished = false;
                  icons = [];
                  setState(() {});
                },
              )
            else
              Column(
                children: [
                  Text(
                    suroo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  CustomButton(
                      text: 'Туура',
                      color: const Color(0xff4AB150),
                      onPressed: () {
                        userAnswered(true);
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                      text: 'Катаа',
                      color: const Color(0xffF54336),
                      onPressed: () {
                        userAnswered(false);
                      }),
                  Row(children: icons),
                ],
              )
          ],
        ),
      ),
    );
  }
}
