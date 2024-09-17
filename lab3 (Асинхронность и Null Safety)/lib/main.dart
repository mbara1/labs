import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/quote_model.dart';

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

Future<void> main() async {
  List<Quote> quotes = [];

  for (int i = 0; i <= 5; i++) {
    quotes.add(await fetchQuote());

    print('Quote ${i + 1}: ${quotes[i].content}, Author: ${quotes[i].author ?? 'unknown'}, Source: ${quotes[i].source ?? 'unknown'}');
  }
}
