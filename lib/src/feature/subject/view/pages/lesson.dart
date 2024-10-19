import 'dart:developer';

import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/shimmer_text_widget.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:coder_shifu/src/data/entity/subject.dart';
import 'package:coder_shifu/src/feature/subject/data/flutter/module_1/fl_1module_1lesson.dart';
import 'package:coder_shifu/src/feature/subject/data/flutter/module_1/fl_1module_2lesson.dart';
import 'package:coder_shifu/src/feature/subject/data/flutter/module_1/fl_1module_3lesson.dart';
import 'package:coder_shifu/src/feature/subject/data/subject_model.dart';
import 'package:coder_shifu/src/feature/subject/view/widgets/lesson_codeui_widget.dart';
import 'package:coder_shifu/src/feature/subject/view/widgets/lesson_ui_widget.dart';
import 'package:coder_shifu/src/feature/subject/view/widgets/lesson_uidocumentaation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../riverpod.dart';

enum ViewType { documentation, code, ui }

class Lesson extends ConsumerStatefulWidget {
  const Lesson({super.key, this.extra});

  final Fan? extra;

  @override
  LessonState createState() => LessonState();
}

class LessonState extends ConsumerState<Lesson> {
  SubjectModel? newModel;
  ViewType currentView = ViewType.documentation;
  late Fan extra;
  bool isCompleted = true;

  @override
  void initState() {
    extra = widget.extra!;
    log("Lesson Page");
    log("Subject name ${extra.subjectName} || Subject Id: ${extra.subjectId}");
    log("Module name ${extra.subjectName} || Module Id: ${extra.subjectId}");
    log("Topic name ${extra.topicName} || Topic Id: ${extra.topicId}");
    findLesson(subjectId: extra.subjectId!, moduleId: extra.moduleId!, topicId: extra.topicId!);
    super.initState();
  }

  void findLesson({required int subjectId, required int moduleId, required int topicId}) {
    log("findLesson S: $subjectId M: $moduleId T: $topicId");

    if (subjectId == 0 && moduleId == 1 && (topicId >= 0 && topicId < 3)) {
      setState(() {
        isCompleted = true;
      });
      switch (subjectId) {
        case (0):
          {
            /// flutter
            switch (moduleId) {
              case (1):
                {
                  /// 1- module 6 all lesson
                  switch (topicId) {
                    case (0):
                      newModel = flModule1Lesson1;
                    case (1):
                      newModel = flModule1Lesson2;
                    case (2):
                      newModel = flModule1Lesson3;
                    case (3):
                      {}
                    case (4):
                      {}
                    case (5):
                      {}
                    case (6):
                      {}
                    default:
                      {}
                  }
                }
              case (2):
                {
                  /// 2- module 6 all lesson
                  switch (topicId) {
                    case (0):
                      {}
                    case (1):
                      {}
                    case (2):
                      {}
                    case (3):
                      {}
                    case (4):
                      {}
                    case (5):
                      {}
                    case (6):
                      {}
                    default:
                      {}
                  }
                }
              case (3):
                {}
              case (4):
                {}
              case (5):
                {}
              case (6):
                {}
              case (7):
                {}
              case (8):
                {}
              case (9):
                {}
              case (10):
                {}
              case (11):
                {}
              case (12):
                {}
              case (13):
                {}
            }
          }
        case (1):
          {} // java
        case (2):
          {} // CSharp
        default:
          {}
      }
    } else {
      setState(() {
        isCompleted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(subjectController);
    final controller = ref.read(subjectController);
    return isCompleted
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: CustomTextWidget(
                extra.topicName ?? "Lesson",
                textColor: context.appTheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: "title".length > 16 ? 15 : 24,
              ),
              iconTheme: IconThemeData(color: context.appTheme.secondary),
              leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back, color: context.appTheme.secondary)),
            ),
            body: Center(
              child: _buildContent(newModel ?? SubjectModel(isCompleted: true)),
            ),
            floatingActionButton: _buildFAB(),
          )
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ShimmerTextWidget("Ushbu Darslar xali Tayyor emas!"),
                  MaterialButton(
                    onPressed: () => context.pop(),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.deepPurpleAccent)),
                    child: const ShimmerTextWidget("Go Back"),
                  )
                ],
              ),
            ),
          );
  }

  Widget _buildContent(SubjectModel model) {
    switch (currentView) {
      case ViewType.documentation:
        return UIDocumentation(
          model: model,
        ); // Add your documentation widget here
      case ViewType.code:
        return CodeUi(model: model); // Add your code widget here
      case ViewType.ui:
        return Ui(model: model); // Add your UI widget here
      default:
        return const CircularProgressIndicator();
    }
  }

  Widget _buildFAB() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: 1.w),
        _buildFABButton(
          label: "Code",
          onPressed: () => _switchView(ViewType.code),
        ),
        SizedBox(width: 5.w),
        _buildFABButton(
          label: "UI",
          onPressed: () => _switchView(ViewType.ui),
        ),
        SizedBox(width: 5.w),
        _buildFABButton(
          label: "Doc",
          onPressed: () => _switchView(ViewType.documentation),
        ),
        SizedBox(width: 1.w),
      ],
    );
  }

  Widget _buildFABButton({required String label, required VoidCallback onPressed}) {
    return MaterialButton(
      onPressed: onPressed,
      color: context.appTheme.primary,
      shape: const StadiumBorder(side: BorderSide(color: Colors.deepPurple)),
      child: CustomTextWidget(
        label,
        textColor: context.appTheme.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  void _switchView(ViewType viewType) {
    setState(() {
      currentView = viewType;
    });
  }
}
