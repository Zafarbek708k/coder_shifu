import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:coder_shifu/src/feature/main/view/pages/subject.dart';
import 'package:flutter/material.dart';

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
        leading: const SizedBox.shrink(),
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
        return const Column(); // Add your UI widget here
      default:
        return const CircularProgressIndicator();
    }
  }

  Widget _buildFAB() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildFABButton(
          label: "Code",
          onPressed: () => _switchView(ViewType.code),
        ),
        const SizedBox(width: 50),
        _buildFABButton(
          label: "UI",
          onPressed: () => _switchView(ViewType.ui),
        ),
        const SizedBox(width: 50),
        _buildFABButton(
          label: "Doc",
          onPressed: () => _switchView(ViewType.documentation),
        ),
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
        fontWeight: FontWeight.w400,
      ),
    );
  }

  void _switchView(ViewType viewType) {
    setState(() {
      currentView = viewType;
    });
  }
}

enum ViewType { documentation, code, ui }

class CodeUi extends StatelessWidget {
  const CodeUi({super.key, required this.model});

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
            child: PageView.builder(
              itemCount: model.codeImageUrl?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(model.codeImageUrl?[index].description ?? "no description"),
                      const SizedBox(height: 10),
                      Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Colors.deepPurple, Colors.deepPurpleAccent, Colors.purple, Colors.purpleAccent],
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          height: 300,
                          width: 375,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(model.codeImageUrl?[index].image ?? "assets/images/x-image.png"), fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
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
