import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:coder_shifu/src/core/constants/context_extension.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "../../../../../riverpod.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../../core/widgets/app_material_context.dart";
import "../../../../core/widgets/text_widget.dart";
import "../widgets/onboarding_content_widget.dart";

class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(entryController);
    final controller = ref.read(entryController);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.onPageChanged(index);
                },
                children: [
                  OnBoardingContent(
                    title: context.localized.welcome1title,
                    description: context.localized.welcome1description,
                    imageName: controller.images[controller.currentPage],
                  ),
                  OnBoardingContent(
                    title: context.localized.welcome2title,
                    description: context.localized.welcome2description,
                    imageName: controller.images[controller.currentPage],
                  ),
                  OnBoardingContent(
                    title: context.localized.welcome3title,
                    description: context.localized.welcome3description,
                    imageName: controller.images[controller.currentPage],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 8,
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: controller.currentPage == 2
                        ? () {
                            context.go(AppRouteName.subject);
                            controller.saveUser();
                          }
                        : () {
                            log("A");
                            controller.pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                    child: CustomTextWidget(controller.currentPage > 1 ? "Get Started" : "Next", textColor: context.appTheme.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// delete local saved user data

//  MaterialButton(onPressed: (){
//               controller.deleteUser();
//               },
//               shape: const StadiumBorder(side: BorderSide(color: Colors.deepOrange)),
//               child: const Text(
//                 "delete user",
//                 style: TextStyle(color: Colors.deepPurple),
//               ),
//             ),
