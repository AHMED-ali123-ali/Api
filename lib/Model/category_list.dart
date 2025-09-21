class Article {
  final String? id;
  final String? author;
  final String title;
  final String description;
  final String urlToImage;

  Article({
    this.id,
    this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
  });
}