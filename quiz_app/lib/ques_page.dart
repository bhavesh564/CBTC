import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuesPage extends StatefulWidget {
  const QuesPage(this.onSeleceAnswer, {super.key});

  final void Function(String answer) onSeleceAnswer;

  @override
  State<QuesPage> createState() {
    return _QuesPageState();
  }
}

class _QuesPageState extends State<QuesPage> {
  int currentQueIndex = 0;
  String selectedAnswer = '';
  List<String> shuffledOptions = [];

  @override
  void initState() {
    super.initState();
    shuffledOptions = questions[currentQueIndex].shuffledList();
  }

  void answerQuestion(String answer) {
    setState(() {
      selectedAnswer = answer;
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          widget.onSeleceAnswer(answer);
          currentQueIndex++;
          if (currentQueIndex < questions.length) {
            shuffledOptions = questions[currentQueIndex].shuffledList();
          }
          selectedAnswer = '';
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQueIndex];
    final correctAnswer = currentQuestion.correctAnswer;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            const Padding(padding: EdgeInsets.only(bottom: 150)),
            Text(
              currentQuestion.ques,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(222, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            ...shuffledOptions.map(
              (answer) {
                return AnswerButton(
                  answer,
                  () => answerQuestion(answer),
                  color: selectedAnswer == ''
                      ? const Color.fromARGB(255, 216, 229, 255)
                      : (answer == correctAnswer
                          ? Colors.green
                          : (answer == selectedAnswer
                              ? Colors.red
                              : const Color.fromARGB(255, 216, 229, 255))),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
