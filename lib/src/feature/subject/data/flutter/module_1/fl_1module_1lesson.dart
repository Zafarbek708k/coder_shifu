import '../../subject_model.dart';

// Dart Module 1: Syntax, Variables, Functions
SubjectModel flModule1Lesson1 = SubjectModel(
  isCompleted: false, // Marking as incomplete initially
  subjectTitle: "Dart Module 1",
  lessonTitle: "Basics of Dart",
  topicTitle: "Syntax, Variables, Functions",

  // UI Images List
  uIImageUrl: [
    Photo(
        description: "UI showcasing a basic Flutter app layout with a Text widget",
        image: "assets/ui_images/basic_app_ui.png"
    ),
    Photo(
        description: "UI displaying a simple TextField and Button interaction",
        image: "assets/ui_images/textfield_button_ui.png"
    ),
  ],

  // Code Images List
  codeImageUrl: [
    Photo(
        description: "Dart Syntax: Simple 'Hello, World!' program",
        image: "assets/code_image/flutter/module1/lesson1/img.png"
    ),
    Photo(
        description: "Variable declaration and initialization in Dart",
        image: "assets/code_image/flutter/module1/lesson1/img_1.png"
    ),
    Photo(
        description: "Defining a simple function in Dart",
        image: "assets/code_image/flutter/module1/lesson1/img_2.png"
    ),
  ],

  documentation: [
    "Variables in Dart store references to values. For example, the variable 'name' can hold a reference to a String object with a value of 'Bob'. Dart infers the type of the variable 'name' to be String, but you can explicitly declare it if needed. If a variable can hold multiple types, use 'Object' or 'dynamic' as the type.",

    "Dart is a true object-oriented language, meaning everything is an object, including functions. Functions in Dart have a type called Function, which allows them to be assigned to variables or passed as arguments to other functions. You can also invoke an instance of a class as if it were a function.",

    "Dart's syntax is clean and easy to read, using braces for blocks and semicolons to terminate statements. Control structures like if, for, and while follow conventional syntax. Comments can be added using // for single-line comments and /* */ for multi-line comments.",

    "Functions in Dart can be defined using the 'void' return type for functions that do not return a value, or specify a return type for functions that do return a value. Functions can also accept parameters, which can have specified types, and can be optional or named."
  ],

);


