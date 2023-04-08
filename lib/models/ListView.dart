import 'package:flutter/material.dart';

class News {
  String title;
  String description;

  News({required this.title, required this.description});
}

class NewsListPage extends StatelessWidget {
  final List<News> news;

  NewsListPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Berita')),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(news[index].title),
            subtitle: Text(news[index].description),
          );
        },
      ),
    );
  }
}

void main() {
  List<News> newsList = [
    News(
      title: 'Berita 1',
      description: 'Deskripsi Berita 1',
    ),
    News(
      title: 'Berita 2',
      description: 'Deskripsi Berita 2',
    ),
    News(
      title: 'Berita 3',
      description: 'Deskripsi Berita 3',
    ),
  ];
  runApp(MaterialApp(
    home: NewsListPage(news: newsList),
  ));
}
