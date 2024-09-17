import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'models/quote_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Quote> fetchQuote() async {
  const String source = 'https://ron-swanson-quotes.herokuapp.com/v2/quotes';

  final url = Uri.parse(source);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return Quote.fromJson({'content': data[0], 'source': source});
  } else {
    throw Exception('Failed to fetch quote');
  }
}

Future<void> saveQuoteSharedPreferences(String quote) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('quote', quote);
}

Future<String?> getQuoteSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('quote');
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/quote.txt');
}

Future<File> saveQuoteFileSystem(String quote) async {
  final file = await _localFile;
  return file.writeAsString(quote);
}

Future<String> getQuoteFileSystem() async {
  try {
    final file = await _localFile;
    return await file.readAsString();
  } catch (e) {
    return 'Error reading quote: $e';
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<Quote> quotes = [];

  for (int i = 0; i <= 5; i++) {
    quotes.add(await fetchQuote());

    print('Quote ${i + 1}: ${quotes[i].content}, Author: ${quotes[i].author ?? 'unknown'}, Source: ${quotes[i].source ?? 'unknown'}');
  }

  print('----------------');

  Quote quote = await fetchQuote();

  //Shared Preferences
  await saveQuoteSharedPreferences(quote.content);
  String? quoteSavedSharedPreferences = await getQuoteSharedPreferences();
  print('Shared Preferences: $quoteSavedSharedPreferences');

  //File System
  await saveQuoteFileSystem(quote.content);
  String quoteSavedFileSystem = await getQuoteFileSystem();

  print('File System: $quoteSavedFileSystem');

  //Database
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

  // Открываем соединение с базой данных
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // Создаем таблицу для хранения данных
        await db.execute(
            'CREATE TABLE Quote (id INTEGER PRIMARY KEY, content TEXT, author TEXT, source TEXT)');
      });

  // Вставляем данные в таблицу
  await database.transaction((txn) async {
    int id = await txn.rawInsert(
        'INSERT INTO Quote(content, author, source) VALUES("${quote.content}", "${quote.author}", "${quote.source}")');
    print('Вставлен id: $id');
  });

  // Получаем данные из таблицы
  List<Map> list = await database.rawQuery('SELECT * FROM Quote');
  print(list);
}
