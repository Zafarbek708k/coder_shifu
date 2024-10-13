import 'dart:developer';
import 'package:coder_shifu/riverpod.dart';
import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/routes/app_route_name.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:coder_shifu/src/data/entity/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widgets/fab_button.dart';
import '../widgets/subject_button_widget.dart';

class Modules extends ConsumerStatefulWidget {
  const Modules({super.key, this.argument});

  final Fan? argument;

  @override
  ModulesState createState() => ModulesState();
}

class ModulesState extends ConsumerState<Modules> {
  bool state1 = true;
  String title = "";
  int? subjectId;

  List<String> checkList({required int index}) {
    switch (index) {
      case 0:
        {
          return ref.read(subjectController).moduleFL;
        }
      case 1:
        {
          return ref.read(subjectController).moduleJV;
        }
      case 2:
        {
          return ref.read(subjectController).moduleCSH;
        }
      default:
        {
          return [];
        }
    }
  }

  @override
  void initState() {
    final extra = widget.argument;
    if (extra != null) {
      setState(() {
        subjectId = extra.subjectId;
        title = extra.subjectName ?? "";
        log(extra.subjectName ?? "subject name null in module page");
        checkList(index: extra.subjectId ?? 5);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(subjectController);
    final controller = ref.read(subjectController);
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          "$title Modules",
          textColor: context.appTheme.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: context.appTheme.secondary),
        ),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: ListView.separated(
            itemCount: checkList(index: widget.argument?.module ?? 0).length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, number) {
              return CustomSubjectButton(
                size: 15,
                title: checkList(index: widget.argument?.subjectId ?? 0)[number],
                onPressed: () {
                  Fan extraFan = Fan(subjectName: title, module: number+1, subjectId: subjectId);
                  log("module = ${extraFan.module}, subID = ${extraFan.subjectId}, SubName = ${extraFan.subjectName}");

                  context.push("${AppRouteName.subject}/${AppRouteName.module}/${AppRouteName.moduleLessons}", extra: extraFan);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
