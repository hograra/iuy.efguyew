import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> favoriteComics;

  FavoritesPage({required this.favoriteComics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: favoriteComics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteComics[index]['title']!),
            trailing: Icon(Icons.favorite),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, String>> cartComics;

  CartPage({required this.cartComics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cartComics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartComics[index]['title']!),
            trailing: Icon(Icons.shopping_cart),
          );
        },
      ),
    );
  }
}