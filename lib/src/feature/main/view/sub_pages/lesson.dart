import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:coder_shifu/src/feature/main/view/pages/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/lesson_codeui_widget.dart';
import '../widgets/lesson_ui_widget.dart';
import '../widgets/lesson_uidocumentaation_widget.dart';

enum ViewType { documentation, code, ui }

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  SubjectModel newModel = model;
  ViewType currentView = ViewType.documentation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          newModel.subjectTitle!,
          textColor: context.appTheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: context.appTheme.secondary),
        ),
      ),
      body: Center(
        child: _buildContent(newModel),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFAB(),
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
