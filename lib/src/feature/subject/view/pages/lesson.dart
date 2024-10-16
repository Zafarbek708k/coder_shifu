import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:coder_shifu/src/data/entity/subject.dart';
import 'package:coder_shifu/src/feature/subject/view/pages/subject.dart';
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
  SubjectModel newModel = model;
  ViewType currentView = ViewType.documentation;


  @override
  Widget build(BuildContext context) {
    ref.watch(subjectController);
    final controller = ref.read(subjectController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          "title",
          textColor: context.appTheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: "title".length > 16 ? 15 : 24,
        ),
        iconTheme: IconThemeData(
            color: context.appTheme.secondary
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
      floatingActionButton:  _buildFAB(),
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



SubjectModel model = SubjectModel(
  isCompleted: true,
  subjectTitle: "Flutter",
  lessonTitle: "Basic of dart",
  uIImageUrl: [
    Photo(description: "Result of linear gradient in a Container", image: "assets/code_image/container-gradient-ui.png"),
  ],
  codeImageUrl: [
    Photo(description: "using shape ", image: "assets/code_image/container-gradient.png"),
    Photo(description: "using border gradient", image: "assets/code_image/container-gradient.png"),
    Photo(description: "using linear gradient", image: "assets/code_image/container-gradient.png"),
  ],
  documentation: [
    "The Container widget in Flutter is a versatile widget for layout, decoration, and alignment.",
    "It can be used to add padding, margin, borders, background color, and other styles to a widget.",
    "Containers can be nested, making it possible to create complex layouts with ease."
        "The Container widget in Flutter is a versatile widget for layout, decoration, and alignment.",
    "It can be used to add padding, margin, borders, background color, and other styles to a widget.",
    "Containers can be nested, making it possible to create complex layouts with ease."
        "The Container widget in Flutter is a versatile widget for layout, decoration, and alignment.",
    "It can be used to add padding, margin, borders, background color, and other styles to a widget.",
    "Containers can be nested, making it possible to create complex layouts with ease."
  ],
);

class SubjectModel {
  String? subjectTitle;
  String? lessonTitle;
  bool isCompleted;
  String? videoUrl;
  List<String>? documentation;
  List<Photo>? codeImageUrl;
  List<Photo>? uIImageUrl;

  SubjectModel(
      {this.subjectTitle, this.codeImageUrl, this.lessonTitle, this.uIImageUrl, this.videoUrl, this.documentation, required this.isCompleted});
}

class Documentation {
  String? title;
  List<String>? docs;

  Documentation({this.title, this.docs});
}

class Photo {
  String? image;
  String? description;

  Photo({this.description, this.image});
}
