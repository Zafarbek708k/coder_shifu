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
        iconTheme: IconThemeData(color: context.appTheme.secondary),
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
                Fan extraFan = Fan(subjectName: controller.subjects[index], subjectId: index);
                context.go("${AppRouteName.subject}/${AppRouteName.module}", extra: extraFan);
                log("subject name ${extraFan.subjectName} = Subject ID number ${extraFan.subjectId}");
              },
            );
          },
        ),
      ),
    );
  }
}
