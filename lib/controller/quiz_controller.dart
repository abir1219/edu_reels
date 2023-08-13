import 'package:get/get.dart';

class QuizController extends GetxController {
  RxInt currentPageIndex = 0.obs;

  // Your list of questions JSON
  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the capital of France?",
      "options": ["Berlin", "Paris", "London", "Madrid"],
      "correctIndex": 1,
    },
    {
      "question": "Which planet is known as the 'Red Planet'?",
      "options": ["Earth", "Mars", "Jupiter", "Venus"],
      "correctIndex": 1,
    },
    {
      "question": "Who painted the Mona Lisa?",
      "options": ["Pablo Picasso", "Leonardo da Vinci", "Vincent van Gogh", "Michelangelo"],
      "correctIndex": 1,
    },
    // Add more questions here
  ];

  void goToNextPage() {
    if (currentPageIndex.value < questions.length - 1) {
      currentPageIndex.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPageIndex.value > 0) {
      currentPageIndex.value--;
    }
  }
}
