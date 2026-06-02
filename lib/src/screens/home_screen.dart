import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_detector_app/src/controller/word_count.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WordCounterController wordCountController =
        Get.put(WordCounterController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.1,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Center(
                  child: Text(
                    'Plagiarism Checker',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),

              Container(
                height: Get.height * 0.7,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    // Text field
                    Obx(() {
                      final bool overLimit = wordCountController.wordCount.value >
                          wordCountController.maxWords;
                      return Container(
                        height: Get.height * 0.58,
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          border: Border.all(
                            color: overLimit
                                ? Theme.of(context).colorScheme.error
                                : Colors.grey,
                            width: overLimit ? 2.0 : 1.25,
                          ),
                        ),
                        child: TextField(
                          controller: wordCountController.textController,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                            hintText: 'Paste or write text here...',
                          ),
                          style:
                              Theme.of(context).textTheme.displaySmall,
                          textAlign: TextAlign.justify,
                        ),
                      );
                    }),

                    // Check button + word count row
                    Container(
                      height: Get.height * 0.07,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 12, right: 0, bottom: 10),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Check button
                          ElevatedButton(
                            onPressed: () {
                              wordCountController.checkPlagiarism();
                            },
                            child: Text(
                              'Check',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge,
                            ),
                          ),

                          Obx(() {
                            final int count =
                                wordCountController.wordCount.value;
                            final int max =
                                wordCountController.maxWords;
                            final bool over = count > max;
                            return Container(
                              margin:
                                  const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: over
                                    ? Theme.of(context)
                                        .colorScheme
                                        .errorContainer
                                    : Theme.of(context)
                                        .colorScheme
                                        .surface,
                                borderRadius:
                                    BorderRadius.circular(4),
                              ),
                              child: Text(
                                '$count / $max words',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: over
                                          ? Theme.of(context)
                                              .colorScheme
                                              .error
                                          : null,
                                      fontWeight: over
                                          ? FontWeight.bold
                                          : null,
                                    ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}