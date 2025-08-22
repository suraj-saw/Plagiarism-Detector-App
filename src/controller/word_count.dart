import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plagiarism_detector_app/src/screens/loading_screen.dart';
import 'package:plagiarism_detector_app/src/screens/result_screen.dart';

class WordCounterController extends GetxController {
  var wordCount = 0.obs;
  final TextEditingController textController = TextEditingController();
  final int maxWords = 500;

  // URL for Flask backend
  final String apiUrl = 'https://45f8379c-9f22-4cad-bc34-92edb34a3756-00-30kbd76txwoeg.sisko.replit.dev';

  void updateWordCount() {
    // Split text by spaces and count non-empty strings
    wordCount.value = textController.text
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .length;
  }

  // Check for plagiarism
Future<void> checkPlagiarism() async {
  final text = textController.text;
  if (text.isEmpty) {
    return;
  }

  // Show the loading screen
  Get.to(() => const LoadingScreen());

  try {
    final response = await http.post(
      Uri.parse('$apiUrl/check_plagiarism'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'text': text}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final bool plagiarismDetected = responseData['plagiarism_detected'];
      final List<dynamic> matchesData = responseData['matches'];

      // Convert the matches list into a List<Map<String, dynamic> with link and snippet
      final List<Map<String, dynamic>> matches = matchesData
          .map((match) => {
                'ngram': match['ngram'],
                'reference_snippet': match['reference_snippet'],
                'link': match['link'],
              })
          .toList();

      // Navigate to the results screen after the data is fetched
      Get.off(() => PlagiarismResultsScreen(
            userText: text,
            plagiarismDetected: plagiarismDetected,
            matches: matches,
          ));
    } else {
      Get.snackbar(
        'Error',
        'Failed to check plagiarism. Status code: ${response.statusCode}',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back();
    }
  } catch (e) {
    Get.snackbar(
      'Error',
      'An error occurred: $e',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.back();
  }
}

  @override
  void onInit() {
    super.onInit();
    textController
        .addListener(updateWordCount);
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
