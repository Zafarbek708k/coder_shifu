import 'dart:developer';
import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/feature/subject/view/widgets/subject_button_widget.dart';
import 'package:coder_shifu/src/feature/subject/vm/subject_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../riverpod.dart';
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


  @override
  void initState() {
    final extra = widget.argument;
    if (extra != null) {
      setState(() {
        title = "${extra.subjectName} ${extra.module} Module";
      });
    }
    determineModuleList(index: extra!.module!, controller: ref.read(subjectController));
    super.initState();
  }

  void determineModuleList({required int index, required SubjectVm controller}){
    switch(index){
      case 1 : {
        moduleLessons = controller.moduleFL1;
      }
      case 2 : {
        moduleLessons = controller.moduleFL2;
      }
      case 3 : {
        moduleLessons = controller.moduleFL3;
      }
      case 4 : {
        moduleLessons = controller.moduleFL4;
      }
      case 5 : {
        moduleLessons = controller.moduleFL5;
      }
      case 6 : {
        moduleLessons = controller.moduleFL6;
      }
      case 7 : {
        moduleLessons = controller.moduleFL7;
      }
      case 8 : {
        moduleLessons = controller.moduleFL8;
      }
      case 9 : {
        moduleLessons = controller.moduleFL9;
      }
      case 10 : {
        moduleLessons = controller.moduleFL10;
      }
      case 11: {
        moduleLessons = controller.moduleFL11;
      }
      case 12 : {
        moduleLessons = controller.moduleFL12;
      }
      case 13 : {
        moduleLessons = controller.moduleFL13;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    log(ref.read(subjectController).runtimeType.toString());
    ref.watch(subjectController);
    final controller = ref.read(subjectController);
    return Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: context.appTheme.secondary, fontSize: 24, fontWeight: FontWeight.bold)),
          iconTheme: IconThemeData(
              color: context.appTheme.secondary
          ),
        ),
        body: ListView.builder(
            itemCount: moduleLessons.length,
            itemBuilder: (context, index) {
              return CustomSubjectButton(
                size: 15,
                title: moduleLessons[index],
                onPressed: () {

                  // context.push("${AppRouteName.subject}/${AppRouteName.contents}/${AppRouteName.contentsDescription}", extra: {"Dart $key": value});
                },
              );
            },)
    );
  }
}





