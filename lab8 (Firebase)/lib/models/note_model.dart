import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String? content;
  String date;

  static final Uuid uuid = Uuid();

  Note({required this.title, this.content, String? date, String? id})
      : date = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
      id = id ?? uuid.v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'date': date,
      };

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
