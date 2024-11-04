import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required super.author,
    required super.quote,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': quote,
      'author': author,
    };
  }

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      author: json['author'],
      quote: json['content'],
    );
  }
}
