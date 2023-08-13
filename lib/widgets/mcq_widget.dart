import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class McqWidget extends StatefulWidget {
  final quizController;
  final index;

  const McqWidget({Key? key, required this.quizController, required this.index})
      : super(key: key);

  @override
  State<McqWidget> createState() => _McqWidgetState();
}

class _McqWidgetState extends State<McqWidget> {
  int correctAnsIndex = -1;

  @override
  Widget build(BuildContext context) {
    final question = widget.quizController.questions[widget.index];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              question['question'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3.5),
              itemBuilder: (context, index) {
                return optionBuilder(question["options"][index],
                    question["correctIndex"], index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget optionBuilder(String option, int correctIndex, int currentIndex) {
    return GestureDetector(
      onTap: () {
        if (correctAnsIndex < 0) {
          // correctAnsIndex = correctIndex == currentIndex ? correctIndex : -1;

          if (correctIndex == currentIndex) {
            correctAnsIndex = correctIndex;
          } else {
            correctAnsIndex = currentIndex;
          }
          debugPrint("---correctAnsIndex--- $correctAnsIndex");
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
            color: correctAnsIndex == correctIndex
                ? Colors.green
                    : Colors.yellow,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          option,
          style: TextStyle(
              fontSize: 16,
              color: correctAnsIndex == correctIndex
                  ? Colors.white
                  : Colors.black),
        ),
      ),
    );
  }
}
