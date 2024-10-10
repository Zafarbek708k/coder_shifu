import 'dart:developer';
import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/routes/app_route_name.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/fab_button.dart';
import '../widgets/subject_button_widget.dart';

class Contents extends StatefulWidget {
  const Contents({super.key});

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  bool state1 = true;

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
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20), child: state1 ? const FlutterUi() : const DartUi()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        children: [
          FABWidget(
            onPressed: () {
              setState(() {
                state1 = true;
              });
            },
            title: "Flutter",
            imageName: "assets/icons/flutter_icon.png",
          ),
          const Spacer(),
          FABWidget(
            onPressed: () {
              setState(() {
                state1 = false;
              });
            },
            title: "Dart",
            imageName: "assets/icons/dart_icon.png",
          ),
        ],
      ),
    );
  }
}

class DartUi extends StatelessWidget {
  const DartUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: contentsOfDart.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                  child: CustomTextWidget(
                    "Dart",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    textColor: context.appTheme.secondary,
                  ),
                );
              }
              String key = contentsOfDart.keys.elementAt(index);
              bool value = contentsOfDart.values.elementAt(index);
              return CustomSubjectButton(
                size: 15,
                title: "Dart $key   ",
                onPressed: () {
                  log("key $key  == value $value");
                  context.push("${AppRouteName.subject}/${AppRouteName.contents}/${AppRouteName.contentsDescription}", extra: {"Dart $key": value});
                },
              );
            },
          ),
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}

class FlutterUi extends StatelessWidget {
  const FlutterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: contentsOfFlutter.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              String key = contentsOfDart.keys.elementAt(index);
              bool value = contentsOfDart.values.elementAt(index);

              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                  child: CustomTextWidget(
                    "Flutter",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    textColor: context.appTheme.secondary,
                  ),
                );
              }
              return CustomSubjectButton(
                size: 15,
                title: "Flutter $key",
                onPressed: () {
                  log("key $key  == value $value");
                  context
                      .push("${AppRouteName.subject}/${AppRouteName.contents}/${AppRouteName.contentsDescription}", extra: {"Flutter $key": value});
                },
              );
            },
          ),
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}

Map<String, bool> contentsOfDart = {
  "Module 1": true,
  "Module 2": false,
  "Module 3": false,
  "Module 4": false,
  "Module 5": false,
  "Module 6": false,
  "Module 7": false,
  // "Dart Pad": true,
  // "Variables": false,
  // "Build in Types": true,
  // "Function": false,
  // "Exception Handling": true,
  // "Operators": false,
  // "Control Flow Statement": true,
  // "Stream": true,
  // "Object-Oriented Programming (OOP)": false,
  // "Collections": true,
  // "Asynchronous Programming": false,
  // "Libraries and Packages": true,
  // "Generics": false,
  // "Mixins and Extensions": true,
  // "Local storage": false,
  // "Network": true,
};

Map<String, bool> contentsOfFlutter = {
  "Module 1": true,
  "Module 2": false,
  "Module 3": false,
  "Module 4": false,
  "Module 5": false,
  "Module 6": false,
  "Module 7": false,
  // "Setting up Flutter Development Environment": true,
  // "Flutter CLI": false,
  // "Flutter Basics": true,
  // "Widgets": false,
  // "Navigation and Routing": true,
  // "Forms and Validation": true,
  // "Networking": false,
  // "Local Storage": true,
  // "Working with Firebase": false,
  // "State Management": true,
  // "Animations": true,
  // "Flutter Architecture Patterns": false,
  // "Internationalization (i18n) and Localization (l10n)": true,
};
