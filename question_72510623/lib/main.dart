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
  final PageController controller = PageController(initialPage: 0);
  bool showNext = true;
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
                      return const QuizResult();
                    }

                    return QuizQuestion(question: questions[index]);
                  },
                ),
              ),
              Visibility(
                visible: showNext,
                child: TextButton(
                  onPressed: () async {
                    await controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );

                    if (controller.page == questions.length) {
                      setState(() => showNext = false);
                    }
                  },
                  child: const Text('Next'),
                ),
              )
            ],
          ),
        ),
      );
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
  const QuizResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('Play Again'),
          ),
        ),
      );
}
