import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_widget.dart';
import '../pages/subject.dart';

class UIDocumentation extends StatelessWidget {
  const UIDocumentation({super.key, required this.model});

  final SubjectModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            model.lessonTitle ?? "No title",
            fontWeight: FontWeight.bold,
            textColor: context.appTheme.secondary,
            fontSize: 22,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: model.documentation?.length ?? 0,
              itemBuilder: (context, index) {
                String? doc = model.documentation?[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Card(
                    child: ListTile(
                      title: CustomTextWidget(
                        doc ?? "No description",
                        fontWeight: FontWeight.w400,
                        textColor: context.appTheme.secondary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}