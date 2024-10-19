// Dart Module 2: Control Flow, Loops, Operators
import '../../subject_model.dart';

SubjectModel flModule1Lesson2 = SubjectModel(
  isCompleted: false,
  subjectTitle: "Dart Module 2",
  lessonTitle: "Control Flow and Loops",
  topicTitle: "Control Flow, Operators, Loops",

  // UI Images List
  uIImageUrl: [
    Photo(
        description: "UI showing how control flow can be used to display conditional text",
        image: "assets/ui_images/control_flow_ui.png"
    ),
    Photo(
        description: "UI demonstrating a list of items using loops",
        image: "assets/ui_images/loops_in_ui.png"
    ),
  ],

  // Code Images List
  codeImageUrl: [
    Photo(
        description: "If-else statement usage in Dart",
        image: "assets/code_images/if_else_code.png"
    ),
    Photo(
        description: "For-loop example in Dart",
        image: "assets/code_images/for_loop_code.png"
    ),
    Photo(
        description: "Using operators in Dart expressions",
        image: "assets/code_images/operators_code.png"
    ),
  ],

  // Documentation List
  documentation: [
    "https://dart.dev/guides/language/language-tour#control-flow-statements - Guide on control flow in Dart",
    "https://dart.dev/guides/language/language-tour#operators - Official Dart documentation on operators",
    "https://dart.dev/guides/language/language-tour#loops-and-iteration - Explanation of loops in Dart",
    "https://flutter.dev/docs/get-started/codelab - Relevant to control flow and loops in Flutter apps"
  ],
);
