class Question {
  final int? id;
  final String word;
  final String? question;
  final List<String>? wrongAnswers;
  final String? image;
  final List<String>? wrongImages;
  final List<String>? definitions;
  final String? definition;

  Question(
      {this.id,
      required this.word,
      this.question,
      this.wrongAnswers,
      this.image,
      this.definition,
      this.definitions,
      this.wrongImages});
}
