import 'dart:developer';

import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/subject_button_widget.dart';

class ContentDescription extends StatefulWidget {
  const ContentDescription({super.key, this.argument});

  final Map<String, bool>? argument;

  @override
  State<ContentDescription> createState() => _ContentDescriptionState();
}

class _ContentDescriptionState extends State<ContentDescription> {
  Map<String, bool>? map;
  String title = "";


  @override
  void initState() {
    final map = widget.argument;
    if (map != null) {
      setState(() {
        title = map.keys.first;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: context.appTheme.secondary, fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        body: ListView.builder(
            itemCount: module1.length,
            itemBuilder: (context, index) {
          String key = module1.keys.elementAt(index);
          bool value = module1.values.elementAt(index);
          return CustomSubjectButton(
            size: 15,
            title: key,
            onPressed: () {
              log("key $key  == value $value");
              // context.push("${AppRouteName.subject}/${AppRouteName.contents}/${AppRouteName.contentsDescription}", extra: {"Dart $key": value});
            },
          );
        })
    );
  }
}

Map<String, bool> module1 = {
  "Container": false,
  "Text": false,
  "SizedBox": false,
  "AppBar": false,
  "Scaffold": false,
  "ListView": false,
};
Map<String, bool> module2 = {
  "Container": false,
  "Text": false,
  "SizedBox": false,
  "AppBar": false,
  "Scaffold": false,
  "ListView": false,
};