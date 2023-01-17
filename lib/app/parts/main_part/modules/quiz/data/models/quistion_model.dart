class Question {
  final int? id;
  final String word;
  final String? question;
  final List<String>? wrongAnswers;
  final String? image;
  final List<String>? wrongImages;
  final String? definition;

  Question(
      {this.id,
      required this.word,
      this.question,
      this.wrongAnswers,
      this.image,
      this.definition,
      this.wrongImages});
}
