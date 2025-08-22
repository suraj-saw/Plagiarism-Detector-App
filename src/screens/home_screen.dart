import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_detector_app/src/controller/word_count.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WordCounterController wordCountController = Get.put(WordCounterController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title Section
              Container(
                height: Get.height * 0.1,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Center(
                  child: Text(
                    "Plagiarism Checker",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              // Text Field and Word Count Section
              Container(
                height: Get.height * 0.7,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    // Input Text Field
                    Container(
                      height: Get.height * 0.58,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.25,
                        ),
                      ),
                      child: TextField(
                        controller: wordCountController.textController,
                        maxLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                          hintText: "Paste or write text here...",
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    // Check Button and Word Count Display
                    Container(
                      height: Get.height * 0.07,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 12, right: 0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Check Button
                          ElevatedButton(
                            onPressed: () {
                              wordCountController.checkPlagiarism();
                            },
                            child: Text("Check", style: Theme.of(context).textTheme.displayLarge,),
                          ),
                          // Word Count Display
                          Obx(() => Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "${wordCountController.wordCount.value} / ${wordCountController.maxWords} words",
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

