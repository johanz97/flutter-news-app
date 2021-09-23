import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider/models/category_models.dart';
import 'package:news_provider/models/news_models.dart';

const _urlNews = 'https://newsapi.org/v2';
const _apiKey = 'da8b9612d05a47af83dfe2b7a09bbe37';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  get getArticleSelectedCategory => categoryArticles[selectedCategory];

  getTopHeadlines() async {
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apiKey&country=us');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final url = Uri.parse(
        '$_urlNews/top-headlines?apiKey=$_apiKey&country=us&category=$category');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
