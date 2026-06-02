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

  static const String _apiBase = 'https://plagiarism-api-black.vercel.app';

  void updateWordCount() {
    wordCount.value = textController.text
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .length;
  }

  Future<void> checkPlagiarism() async {
    final text = textController.text.trim();

    if (text.isEmpty) {
      Get.snackbar(
        'Empty Text',
        'Please enter some text before checking.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.errorContainer,
        colorText: Get.theme.colorScheme.onErrorContainer,
      );
      return;
    }

    if (wordCount.value > maxWords) {
      Get.snackbar(
        'Word Limit Exceeded',
        'Please reduce your text to $maxWords words or fewer.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.errorContainer,
        colorText: Get.theme.colorScheme.onErrorContainer,
      );
      return;
    }

    Get.to(() => const LoadingScreen());

    try {
      final response = await http
          .post(
            Uri.parse('$_apiBase/check_plagiarism'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'text': text}),
          )
          .timeout(
            const Duration(seconds: 60),
            onTimeout: () => throw Exception(
              'Request timed out. Please check your connection and try again.',
            ),
          );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final bool plagiarismDetected =
            responseData['plagiarism_detected'] as bool? ?? false;

        final double plagiarismPercentage =
            (responseData['plagiarism_percentage'] as num?)?.toDouble() ?? 0.0;

        final List<dynamic> matchesData =
            responseData['matches'] as List<dynamic>? ?? [];

        final List<Map<String, dynamic>> matches = matchesData
            .map((match) => {
                  'ngram': match['ngram'] as String? ?? '',
                  'reference_snippet':
                      match['reference_snippet'] as String? ?? '',
                  'link': match['link'] as String? ?? 'No link available',
                })
            .toList();

        final seen = <String>{};
        final uniqueMatches = matches
            .where((m) => seen.add(m['link'] as String))
            .toList();

        Get.off(() => PlagiarismResultsScreen(
              userText: text,
              plagiarismDetected: plagiarismDetected,
              plagiarismPercentage: plagiarismPercentage,
              matches: uniqueMatches,
            ));
      } else {
        Get.back();
        Get.snackbar(
          'Server Error',
          'Failed to check plagiarism. Status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.errorContainer,
          colorText: Get.theme.colorScheme.onErrorContainer,
        );
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Error',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.errorContainer,
        colorText: Get.theme.colorScheme.onErrorContainer,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    textController.addListener(updateWordCount);
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}