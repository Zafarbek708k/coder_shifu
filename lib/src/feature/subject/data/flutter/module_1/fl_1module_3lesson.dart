
// Dart Module 3: Classes, Objects, Inheritance
import '../../subject_model.dart';

SubjectModel flModule1Lesson3 = SubjectModel(
  isCompleted: false,
  subjectTitle: "Dart Module 3",
  lessonTitle: "Object-Oriented Programming",
  topicTitle: "Classes, Objects, Inheritance",

  // UI Images List
  uIImageUrl: [
    Photo(
        description: "UI with a card layout showcasing data from an object",
        image: "assets/ui_images/oop_ui.png"
    ),
    Photo(
        description: "UI displaying a hierarchical structure, useful for explaining inheritance",
        image: "assets/ui_images/inheritance_ui.png"
    ),
  ],

  // Code Images List
  codeImageUrl: [
    Photo(
        description: "Dart code for defining a class and creating objects",
        image: "assets/code_images/class_object_code.png"
    ),
    Photo(
        description: "Inheritance example in Dart with parent and child classes",
        image: "assets/code_images/inheritance_code.png"
    ),
    Photo(
        description: "Constructor and initialization example",
        image: "assets/code_images/constructor_code.png"
    ),
  ],

  // Documentation List
  documentation: [
    "https://dart.dev/guides/language/language-tour#classes - Official Dart guide on classes and objects",
    "https://dart.dev/guides/language/language-tour#inheritance - Detailed documentation on inheritance in Dart",
    "https://dart.dev/guides/language/language-tour#constructors - Guide on constructors and initialization",
    "https://flutter.dev/docs/development/data-and-backend/json - Flutter documentation for handling data models and classes"
  ],
);