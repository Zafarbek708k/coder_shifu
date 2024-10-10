import "dart:developer";

import "package:coder_shifu/riverpod.dart";
import "package:coder_shifu/src/core/constants/context_extension.dart";
import "package:coder_shifu/src/core/routes/app_route_name.dart";
import "package:coder_shifu/src/core/widgets/text_widget.dart";
import "package:coder_shifu/src/data/entity/subject.dart";
import "package:coder_shifu/src/feature/subject/view/widgets/subject_button_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class Subject extends ConsumerStatefulWidget {
  const Subject({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubjectState();
}

class _SubjectState extends ConsumerState<Subject> {
  @override
  Widget build(BuildContext context) {
    ref.watch(subjectController);
    final controller = ref.read(subjectController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget("Subjects", textColor: context.appTheme.secondary, fontSize: 24, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: context.appTheme.secondary
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: controller.subjects.length,
          itemBuilder: (context, index) {
            return CustomSubjectButton(
              title: controller.subjects[index],
              imageName: controller.subjectsImg[index],
              onPressed: () {
                // get subject title from selected item and add extra value for the data transfer to next page
                // for example String value  = "Flutter';
                log("subject name $index => ${controller.subjects[index]}");
                Fan extraFan = Fan(subjectName: controller.subjects[index]);
                log(extraFan.subjectName ?? "extra null data ");

                if(index == 0){
                  context.go("${AppRouteName.subject}/${AppRouteName.module}", extra: extraFan);
                }
              },
            );
          },
        ),
      ),
    );
  }
}











SubjectModel model = SubjectModel(
  isCompleted: true,
  subjectTitle: "Flutter",
  lessonTitle: "Container widget",
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
