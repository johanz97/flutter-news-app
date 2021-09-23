import 'package:flutter/material.dart';
import 'package:news_provider/models/category_models.dart';
import 'package:news_provider/services/news_services.dart';
import 'package:news_provider/theme/tema.dart';
import 'package:news_provider/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page() : super(key: null);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _ListaCategorias(),
          Expanded(
              child: (newsService.getArticleSelectedCategory.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : ListaNoticias(newsService.getArticleSelectedCategory))
        ],
      )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final categoryName = categories[index].name;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  _CategoryButton(categories[index]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      '${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;
  const _CategoryButton(this.category) : super(key: null);
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () => newService.selectedCategory = category.name,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newService.selectedCategory == category.name)
              ? miTema.colorScheme.secondary
              : Colors.black54,
        ),
      ),
    );
  }
}
