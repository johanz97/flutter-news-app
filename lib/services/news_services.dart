import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider/models/news_models.dart';

const _urlNews = 'https://newsapi.org/v2';
const _apiKey = 'da8b9612d05a47af83dfe2b7a09bbe37';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apiKey&country=us');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
