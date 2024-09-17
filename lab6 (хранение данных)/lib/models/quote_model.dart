class Quote {
  final String content;
  final String? author;
  final String? source;

  Quote({required this.content, this.author, this.source});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'] as String,
      author: json['author'] as String?,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'author': author,
      'source': source,
    };
  }
}
