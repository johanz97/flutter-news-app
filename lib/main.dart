import 'package:flutter/material.dart';
import 'package:news_provider/pages/tabs_page.dart';
import 'package:news_provider/services/news_services.dart';
import 'package:news_provider/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp() : super(key: null);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: miTema,
        home: const TabsPage(),
      ),
    );
  }
}
