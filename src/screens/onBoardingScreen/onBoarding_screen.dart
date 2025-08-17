import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/constants/images_string.dart';
import 'package:plagiarism_app/src/constants/text_string.dart';
import 'package:plagiarism_app/src/screens/onBoardingScreen/onBoarding_controller.dart';
import 'package:plagiarism_app/src/screens/onBoardingScreen/onBoarding_widget.dart';
import 'package:plagiarism_app/src/screens/welcomeScreen/welcome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        PageView(
          controller: controller.indicator,
          onPageChanged: ((value) {
            controller.page.value = value;
            print(controller.page.value);
          }),
          children: const [
            OnboardingWidget(
              image: tOnBoardingPage1,
              title: tOnBoardingPageTitle1,
              subTitle: tOnBoardingPageSubTitle1,
            ),
            OnboardingWidget(
              image: tOnBoardingPage2,
              title: tOnBoardingPageTitle2,
              subTitle: tOnBoardingPageSubTitle2,
            ),
            OnboardingWidget(
              image: tOnBoardingPage3,
              title: tOnBoardingPageTitle3,
              subTitle: tOnBoardingPageSubTitle3,
            ),
          ],
        ),
        Obx(
          () => Container(
            alignment: const Alignment(0.8, -0.85),
            child: controller.page.value != 2
                ? GestureDetector(
                    onTap: () {
                      controller.indicator.jumpToPage(2);
                    },
                    child: const Text("Skip",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        )),
                  )
                : const SizedBox(), // Placeholder when on the final page
          ),
        ),
        Obx(
          () => Container(
              alignment: const Alignment(0, 0.85),
              child: controller.page.value != 2
                  ? SmoothPageIndicator(
                      controller: controller.indicator,
                      count: 3,
                      effect: const SlideEffect(
                        activeDotColor: Colors.purple,
                        spacing: 8.0,
                        radius: 4.0,
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: Colors.grey,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.to(Welcome());
                      },
                      child: Container(
                        height: 55,
                        width: Get.width * 0.8,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Get Started",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    )),
        ),
      ],
    )));
  }
}
