class Question {
  final int? id;

  final String word;
  int? qType;
  final String? question;
  final List<String>? options;
  final String? image;
  final List<String>? wrongImages;
  final List<String>? definitions;
  final String? definition;

  Question(
      {this.id,
      required this.word,
      this.qType,
      this.question,
      this.options,
      this.image,
      this.definition,
      this.definitions,
      this.wrongImages});
}
