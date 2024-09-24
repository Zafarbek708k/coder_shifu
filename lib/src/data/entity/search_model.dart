// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  final SearchParameters? searchParameters;
  final KnowledgeGraph? knowledgeGraph;
  final List<Organic>? organic;
  final List<PeopleAlsoAsk>? peopleAlsoAsk;
  final List<RelatedSearch>? relatedSearches;
  final int? credits;

  SearchModel({
    this.searchParameters,
    this.knowledgeGraph,
    this.organic,
    this.peopleAlsoAsk,
    this.relatedSearches,
    this.credits,
  });

  SearchModel copyWith({
    SearchParameters? searchParameters,
    KnowledgeGraph? knowledgeGraph,
    List<Organic>? organic,
    List<PeopleAlsoAsk>? peopleAlsoAsk,
    List<RelatedSearch>? relatedSearches,
    int? credits,
  }) =>
      SearchModel(
        searchParameters: searchParameters ?? this.searchParameters,
        knowledgeGraph: knowledgeGraph ?? this.knowledgeGraph,
        organic: organic ?? this.organic,
        peopleAlsoAsk: peopleAlsoAsk ?? this.peopleAlsoAsk,
        relatedSearches: relatedSearches ?? this.relatedSearches,
        credits: credits ?? this.credits,
      );

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    searchParameters: json["searchParameters"] == null ? null : SearchParameters.fromJson(json["searchParameters"]),
    knowledgeGraph: json["knowledgeGraph"] == null ? null : KnowledgeGraph.fromJson(json["knowledgeGraph"]),
    organic: json["organic"] == null ? [] : List<Organic>.from(json["organic"]!.map((x) => Organic.fromJson(x))),
    peopleAlsoAsk: json["peopleAlsoAsk"] == null ? [] : List<PeopleAlsoAsk>.from(json["peopleAlsoAsk"]!.map((x) => PeopleAlsoAsk.fromJson(x))),
    relatedSearches: json["relatedSearches"] == null ? [] : List<RelatedSearch>.from(json["relatedSearches"]!.map((x) => RelatedSearch.fromJson(x))),
    credits: json["credits"],
  );

  Map<String, dynamic> toJson() => {
    "searchParameters": searchParameters?.toJson(),
    "knowledgeGraph": knowledgeGraph?.toJson(),
    "organic": organic == null ? [] : List<dynamic>.from(organic!.map((x) => x.toJson())),
    "peopleAlsoAsk": peopleAlsoAsk == null ? [] : List<dynamic>.from(peopleAlsoAsk!.map((x) => x.toJson())),
    "relatedSearches": relatedSearches == null ? [] : List<dynamic>.from(relatedSearches!.map((x) => x.toJson())),
    "credits": credits,
  };
}

class KnowledgeGraph {
  final String? title;
  final String? imageUrl;
  final String? description;
  final String? descriptionSource;
  final String? descriptionLink;
  final Attributes? attributes;

  KnowledgeGraph({
    this.title,
    this.imageUrl,
    this.description,
    this.descriptionSource,
    this.descriptionLink,
    this.attributes,
  });

  KnowledgeGraph copyWith({
    String? title,
    String? imageUrl,
    String? description,
    String? descriptionSource,
    String? descriptionLink,
    Attributes? attributes,
  }) =>
      KnowledgeGraph(
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        descriptionSource: descriptionSource ?? this.descriptionSource,
        descriptionLink: descriptionLink ?? this.descriptionLink,
        attributes: attributes ?? this.attributes,
      );

  factory KnowledgeGraph.fromJson(Map<String, dynamic> json) => KnowledgeGraph(
    title: json["title"],
    imageUrl: json["imageUrl"],
    description: json["description"],
    descriptionSource: json["descriptionSource"],
    descriptionLink: json["descriptionLink"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "imageUrl": imageUrl,
    "description": description,
    "descriptionSource": descriptionSource,
    "descriptionLink": descriptionLink,
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  final String? largestSpecies;

  Attributes({
    this.largestSpecies,
  });

  Attributes copyWith({
    String? largestSpecies,
  }) =>
      Attributes(
        largestSpecies: largestSpecies ?? this.largestSpecies,
      );

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    largestSpecies: json["Largest species"],
  );

  Map<String, dynamic> toJson() => {
    "Largest species": largestSpecies,
  };
}

class Organic {
  final String? title;
  final String? link;
  final String? snippet;
  final int? position;
  final List<Sitelink>? sitelinks;

  Organic({
    this.title,
    this.link,
    this.snippet,
    this.position,
    this.sitelinks,
  });

  Organic copyWith({
    String? title,
    String? link,
    String? snippet,
    int? position,
    List<Sitelink>? sitelinks,
  }) =>
      Organic(
        title: title ?? this.title,
        link: link ?? this.link,
        snippet: snippet ?? this.snippet,
        position: position ?? this.position,
        sitelinks: sitelinks ?? this.sitelinks,
      );

  factory Organic.fromJson(Map<String, dynamic> json) => Organic(
    title: json["title"],
    link: json["link"],
    snippet: json["snippet"],
    position: json["position"],
    sitelinks: json["sitelinks"] == null ? [] : List<Sitelink>.from(json["sitelinks"]!.map((x) => Sitelink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
    "snippet": snippet,
    "position": position,
    "sitelinks": sitelinks == null ? [] : List<dynamic>.from(sitelinks!.map((x) => x.toJson())),
  };
}

class Sitelink {
  final String? title;
  final String? link;

  Sitelink({
    this.title,
    this.link,
  });

  Sitelink copyWith({
    String? title,
    String? link,
  }) =>
      Sitelink(
        title: title ?? this.title,
        link: link ?? this.link,
      );

  factory Sitelink.fromJson(Map<String, dynamic> json) => Sitelink(
    title: json["title"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
  };
}

class PeopleAlsoAsk {
  final String? question;
  final String? snippet;
  final String? title;
  final String? link;

  PeopleAlsoAsk({
    this.question,
    this.snippet,
    this.title,
    this.link,
  });

  PeopleAlsoAsk copyWith({
    String? question,
    String? snippet,
    String? title,
    String? link,
  }) =>
      PeopleAlsoAsk(
        question: question ?? this.question,
        snippet: snippet ?? this.snippet,
        title: title ?? this.title,
        link: link ?? this.link,
      );

  factory PeopleAlsoAsk.fromJson(Map<String, dynamic> json) => PeopleAlsoAsk(
    question: json["question"],
    snippet: json["snippet"],
    title: json["title"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "snippet": snippet,
    "title": title,
    "link": link,
  };
}

class RelatedSearch {
  final String? query;

  RelatedSearch({
    this.query,
  });

  RelatedSearch copyWith({
    String? query,
  }) =>
      RelatedSearch(
        query: query ?? this.query,
      );

  factory RelatedSearch.fromJson(Map<String, dynamic> json) => RelatedSearch(
    query: json["query"],
  );

  Map<String, dynamic> toJson() => {
    "query": query,
  };
}

class SearchParameters {
  final String? q;
  final String? type;
  final String? engine;

  SearchParameters({
    this.q,
    this.type,
    this.engine,
  });

  SearchParameters copyWith({
    String? q,
    String? type,
    String? engine,
  }) =>
      SearchParameters(
        q: q ?? this.q,
        type: type ?? this.type,
        engine: engine ?? this.engine,
      );

  factory SearchParameters.fromJson(Map<String, dynamic> json) => SearchParameters(
    q: json["q"],
    type: json["type"],
    engine: json["engine"],
  );

  Map<String, dynamic> toJson() => {
    "q": q,
    "type": type,
    "engine": engine,
  };
}
