import "package:coder_shifu/src/core/constants/context_extension.dart";
import "package:coder_shifu/src/core/routes/app_route_name.dart";
import "package:coder_shifu/src/core/widgets/text_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "../../../../core/widgets/app_material_context.dart";
import "../widgets/subject_button_widget.dart";

class Subject extends ConsumerStatefulWidget {
  const Subject({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubjectState();
}

class _SubjectState extends ConsumerState<Subject> {
  @override
  Widget build(BuildContext context) {
    // ref.watch(homePageController);
    // final controller = ref.read(homePageController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget("Subjects", textColor: context.appTheme.secondary, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSubjectButton(
              title: "Flutter    ",
              imageName: "assets/icons/flutter_icon.png",
              onPressed: () {
                context.go("${AppRouteName.subject}/${AppRouteName.contents}");
              },
            ),
            CustomSubjectButton(
              title: "Java  ",
              imageName: "assets/icons/java_icon.png",
              onPressed: () {},
            ),
            CustomSubjectButton(
              title: "C#  ",
              imageName: "assets/icons/c_sharp_icon.png",
              onPressed: () {},
            ),
            MaterialButton(
              onPressed: () async {
                themeController.switchTheme(); // Using the shared instance
              },
              shape: const StadiumBorder(
                side: BorderSide(color: Colors.deepOrange),
              ),
              child: const Text("Theme"),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrangeAccent,
                  Colors.orange,
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

SubjectModel model = SubjectModel(subjectTitle: "Flutter", lessonTitle: "Container widget", codeImageUrl: [
  Photo(description: "using shape ", image: "assets/code_image/container-gradient.png"),
  Photo(description: "using border gradient", image: "assets/code_image/container-gradient.png"),
  Photo(description: "using linear gradient", image: "assets/code_image/container-gradient.png"),
], uIImageUrl: [
  Photo(description: "Result of linear gradient in a Container", image: "assets/code_image/container-gradient-ui.png")
], documentation: [
  "The Container widget in Flutter is a versatile widget for layout, decoration, and alignment.",
  "It can be used to add padding, margin, borders, background color, and other styles to a widget.",
  "Containers can be nested, making it possible to create complex layouts with ease."
]);

class SubjectModel {
  String? subjectTitle;
  String? lessonTitle;
  String? videoUrl;
  List<String>? documentation;
  List<Photo>? codeImageUrl;
  List<Photo>? uIImageUrl;

  SubjectModel({this.subjectTitle, this.codeImageUrl, this.lessonTitle, this.uIImageUrl, this.videoUrl, this.documentation});
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
