import 'package:quiz_app/quiz.dart';

class QuizBrain {
  int _index = 0;
  List<Quiz> questionsAnswers = <Quiz>[
    Quiz(question: 'Kyrgyzstanda 7 oblast barby?', answer: true),
    Quiz(question: 'Kyrgyzstanda 41 raion barby?', answer: false),
    Quiz(
        question:
            'Kyrgyzstanda koldor kandai agyn suular arkyluu paida bolgonbu?',
        answer: false),
    Quiz(question: 'Kyrgyzdar 30 uul, ichkilik bolup bolunobu?', answer: true),
    Quiz(question: 'Teskei Ala-Toosu Yssyk-Koldo jaigashkanby?', answer: true),
    Quiz(question: 'Kyrgyzstandyn jerinin aynty 199 min km bi?', answer: false),
    Quiz(
        question:
            'Usundardy Kyrgyzdardyn ata-babasy degen pikirdi Aristov aitkanby?',
        answer: true),
  ];
  String getQuestions() {
    if (_index < questionsAnswers.length) {
      return questionsAnswers[_index].question;
    } else {
      return 'Suroolor buttu!';
    }
  }

  bool getAnswer() {
    if (_index < questionsAnswers.length) {
      return questionsAnswers[_index].answer;
    }
  }

  void getNext() {
    _index++;
  }

  void restart() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
