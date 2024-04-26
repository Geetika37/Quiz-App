import 'package:_2_quiz_app/data/questions.dart';
import 'package:_2_quiz_app/pages/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // in this first we created based on the answer list whch is a list of strings,
            // which is then converted with help of map from a list of strings to a list of answer buttons
            // and then these answer buttons are pulled out,and added as individual elements to this children list
            // so that overall here we get a list of widgets

            ...currentQuestion.getShuffledAnswers().map(
              (answers) {
                return AnswerButton(answerText: answers, onTap: answerQuestion);
              },
            ),
          ],
        ),
      ),
    );
  }
}
