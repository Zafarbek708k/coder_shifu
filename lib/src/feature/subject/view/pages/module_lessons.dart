import 'dart:developer';
import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/feature/subject/view/widgets/subject_button_widget.dart';
import 'package:coder_shifu/src/feature/subject/vm/subject_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../riverpod.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../../data/entity/subject.dart';

class ModuleLessons extends ConsumerStatefulWidget {
  const ModuleLessons({super.key, this.argument});

  final Fan? argument;

  @override
  ModuleLessonsState createState() => ModuleLessonsState();
}

class ModuleLessonsState extends ConsumerState<ModuleLessons> {
  Fan? subject;
  String title = "";
  List<String> moduleLessons = [];
  Fan? extra;

  @override
  void initState() {
    extra = widget.argument!;
    title = "${extra!.subjectName} ${extra!.module} Module";
    selectSubject(moduleID: extra!.module!, controller: ref.read(subjectController), subjectId: extra!.subjectId!);
    super.initState();
  }

  void selectSubject({required int subjectId, required int moduleID, required SubjectVm controller}){
    if(subjectId ==0){
      switch (moduleID) {
        case 1:moduleLessons = controller.moduleFL1;
        case 2:moduleLessons = controller.moduleFL2;
        case 3:moduleLessons = controller.moduleFL3;
        case 4:moduleLessons = controller.moduleFL4;
        case 5:moduleLessons = controller.moduleFL5;
        case 6:moduleLessons = controller.moduleFL6;
        case 7:moduleLessons = controller.moduleFL7;
        case 8:moduleLessons = controller.moduleFL8;
        case 9:moduleLessons = controller.moduleFL9;
        case 10:moduleLessons = controller.moduleFL10;
        case 11:moduleLessons = controller.moduleFL11;
        case 12:moduleLessons = controller.moduleFL12;
        case 13:moduleLessons = controller.moduleFL13;
        default : moduleLessons = [];
      }
    }else if(subjectId == 1){
      switch (moduleID) {
        case 1:moduleLessons = controller.moduleJava1;
        case 2:moduleLessons = controller.moduleJava2;
        case 3:moduleLessons = controller.moduleJava3;
        case 4:moduleLessons = controller.moduleJava4;
        case 5:moduleLessons = controller.moduleJava5;
        case 6:moduleLessons = controller.moduleJava6;
        case 7:moduleLessons = controller.moduleJava7;
        case 8:moduleLessons = controller.moduleJava8;
        case 9:moduleLessons = controller.moduleJava9;
        case 10:moduleLessons = controller.moduleJava10;
        case 11:moduleLessons = controller.moduleJava11;
        case 12:moduleLessons = controller.moduleJava12;
        case 13:moduleLessons = controller.moduleJava13;
        default : moduleLessons = [];
      }
    }else if(subjectId == 2){
      switch (moduleID) {
        case 1:moduleLessons = controller.moduleCSharp1;
        case 2:moduleLessons = controller.moduleCSharp2;
        case 3:moduleLessons = controller.moduleCSharp3;
        case 4:moduleLessons = controller.moduleCSharp4;
        case 5:moduleLessons = controller.moduleCSharp5;
        case 6:moduleLessons = controller.moduleCSharp6;
        case 7:moduleLessons = controller.moduleCSharp7;
        case 8:moduleLessons = controller.moduleCSharp8;
        case 9:moduleLessons = controller.moduleCSharp9;
        case 10:moduleLessons = controller.moduleCSharp10;
        case 11:moduleLessons = controller.moduleCSharp11;
        case 12:moduleLessons = controller.moduleCSharp12;
        case 13:moduleLessons = controller.moduleCSharp13;
        default : moduleLessons = [];
      }
    }else{
      moduleLessons = [];
    }
  }




  @override
  Widget build(BuildContext context) {
    log(ref.read(subjectController).runtimeType.toString());
    ref.watch(subjectController);
    final controller = ref.read(subjectController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          title,
          textColor: context.appTheme.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
      ),
      body: ListView.builder(
        itemCount: moduleLessons.length,
        itemBuilder: (context, index) {
          return CustomSubjectButton(
            size: 15,
            title: moduleLessons[index],
            onPressed: () {
              extra!.topicName = moduleLessons[index];
              log(extra!.module.toString());
              log(extra!.subjectName.toString());
              log(extra!.topicName.toString());
              // context.push("${AppRouteName.subject}/${AppRouteName.contents}/${AppRouteName.contentsDescription}", extra: {"Dart $key": value});
            },
          );
        },
      ),
    );
  }
}
