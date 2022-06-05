import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const QuizScreen(),
      );
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController controller = PageController();
  int currentPage = 0;
  List<String> questions = [
    'Which is the fastest animal?',
    'Which is the slowest animal?',
    'Which is the longest animal?',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  itemCount: questions.length + 1,
                  itemBuilder: (context, index) {
                    if (index == questions.length) {
                      return QuizResult(onPressed: onPressed);
                    }

                    return QuizQuestion(question: questions[index]);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  if (currentPage == questions.length) return;

                  controller.jumpToPage(++currentPage);
                },
                child: const Text('Next'),
              )
            ],
          ),
        ),
      );

  void onPressed() {
    controller.jumpToPage(0);
    currentPage = 0;
  }
}

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({Key? key, required this.question}) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) => Center(
        child: Text(question),
      );
}

class QuizResult extends StatelessWidget {
  const QuizResult({Key? key, required this.onPressed}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: TextButton(
            onPressed: onPressed,
            child: const Text('Play Again'),
          ),
        ),
      );
}
