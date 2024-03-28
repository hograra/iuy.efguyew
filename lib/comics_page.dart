import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comics_details_page.dart';
import 'favorite_pages.dart';

class ComicsPage extends StatefulWidget {
  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  List<Map<String, String>> allComicsData = [
    {
      'imagePath': 'https://ir.ozone.ru/s3/multimedia-k/wc1000/6891207140.jpg',
      'title': 'Мстители',
      'description': 'Башня Мстителей (Avengers Tower) относится к серии блоков Marvel, которые содержат 5201 строительные частицы.'
          ' Цена: 100 рублей',
    },
    {
      'imagePath': 'https://ir.ozone.ru/s3/multimedia-i/wc1000/6785146674.jpg',
      'title': 'Дарт Вейдер',
      'description': 'Рыцаря-джедая Энакина Скайуокера больше нет! Отныне его место занял жуткий повелитель ситхов Дарт Вейдер, единственная цель в жизни которого — служить своему новому учителю, Императору Палпатину, и нести его волю по всей Галактике.'
          ' Цена: 150 рублей',
    },
    {
      'imagePath': 'https://ir.ozone.ru/s3/multimedia-y/wc1000/6335777650.jpg',
      'title': 'SuperMan',
      'description': 'Также известен как «Человек из стали» — один из сильнейших супергероев во вселенной DC. Его способности включают в себя невероятную суперсилу, суперскорость, неуязвимость, ледяное дыхание, полет и тепловое зрение. Настоящее имя — Кал-Эл. Родился Кал-Эл на умирающей планете Криптон. Его родители Джор-Эл и Лара отправили его в ракете к планете Земля, где он будет последним выжившим представителем своего вида. Здесь представлен один из старых комиксов DC Супермена.'
          ' Цена: 14 долларов',
    },
  ];
  List<Map<String, String>> favoriteComics = [];
  List<Map<String, String>> cartComics = [];

  List<String> users = ["Чудо Женщина", "Джокер", "Киборг"];
  List<IconData> icons = [Icons.book_outlined, Icons.book_outlined, Icons.book_outlined];

  void addToFavorites(int index) {
    setState(() {
      favoriteComics.add(allComicsData[index]);
    });
  }

  void addToCart(int index) {
    setState(() {
      cartComics.add(allComicsData[index]);
    });
  }

  void navigateToFavorites() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage(favoriteComics: favoriteComics)));
  }

  void navigateToCart() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cartComics: cartComics)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Комиксы')),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allComicsData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ComicDetailPage(imagePath: allComicsData[index]['imagePath']!, description: allComicsData[index]['description']!)));
                  },
                  child: Container(
                    margin: EdgeInsets.all(4.0),
                    width: 130,
                    child: Image.network(allComicsData[index]['imagePath']!, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allComicsData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allComicsData[index]['title']!),
                  leading: Icon(icons[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          addToFavorites(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          addToCart(index);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ComicDetailPage(imagePath: allComicsData[index]['imagePath']!, description: allComicsData[index]['description']!)));
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: navigateToFavorites,
            child: Text('Избранное'),
          ),
          ElevatedButton(
            onPressed: navigateToCart,
            child: Text('Корзина'),
          ),
        ],
      ),
    );
  }
}