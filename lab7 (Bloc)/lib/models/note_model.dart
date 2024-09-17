import 'package:intl/intl.dart';

class Note {
  String title;
  String? content;
  String date;

  Note({required this.title, this.content, String? date})
      : date = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'date': date,
      };

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
