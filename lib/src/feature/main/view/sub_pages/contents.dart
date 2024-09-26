import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/subject_button_widget.dart';

class Contents extends StatefulWidget {
  const Contents({super.key});

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          "Contents",
          textColor: context.appTheme.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: context.appTheme.secondary),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dart Section Title
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                  child: CustomTextWidget(
                    "Dart",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    textColor: context.appTheme.secondary,
                  ),
                ),
                // List of Dart Contents
                SizedBox(
                  height: 350, // Fixed height to prevent overflow
                  child: ListView.separated(
                    itemCount: contentsOfDart.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return CustomSubjectButton(
                        size: 15,
                        title: "${contentsOfDart[index]}   ",
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                      );
                    },
                  ),
                ),

                // Flutter Section Title
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20, bottom: 10),
                  child: CustomTextWidget(
                    "Flutter",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    textColor: context.appTheme.secondary,
                  ),
                ),
                // List of Flutter Contents
                SizedBox(
                  height: 450, // Fixed height for flutter contents
                  child: ListView.separated(
                    itemCount: contentsOfFlutter.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return CustomSubjectButton(
                        size: 15,
                        title: "${contentsOfFlutter[index]}   ",
                        onPressed: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> contentsOfDart = [
  "Dart Pad",
  "Variables",
  "Build in Types",
  "Function",
  "Exception Handling",
  "Operators",
  "Control Flow Statement",
  "Stream",
  "Object-Oriented Programming (OOP)",
  "Collections",
  "Asynchronous Programming",
  "Libraries and Packages",
  "Generics",
  "Mixins and Extensions",
  "Local storage",
  "Network",
];

List<String> contentsOfFlutter = [
  "Setting up Flutter Development Environment",
  "Flutter CLI",
  "Flutter Basics",
  "Widgets",
  "Navigation and Routing",
  "Forms and Validation",
  "Networking",
  "Local Storage",
  "Working with Firebase",
  "State Management",
  "Animations",
  "Flutter Architecture Patterns",
  "Internationalization (i18n) and Localization (l10n)"
];
