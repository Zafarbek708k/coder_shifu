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
  String? subjectTitle, lessonTitle, topicTitle;
  bool isCompleted;
  String? videoUrl;
  List<String>? documentation;
  List<Photo>? codeImageUrl;
  List<Photo>? uIImageUrl;

  SubjectModel(
      {this.subjectTitle,
      this.topicTitle,
      this.codeImageUrl,
      this.lessonTitle,
      this.uIImageUrl,
      this.videoUrl,
      this.documentation,
      required this.isCompleted});
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
