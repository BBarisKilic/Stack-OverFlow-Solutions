import 'package:flutter/material.dart';

import '../model/product.dart';

enum ViewState {
  idle,
  ready,
}

class HomeViewModel extends ChangeNotifier {
  final List<Product> products = [];
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  Future<void> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    products.addAll([
      Product(
        'Black Shirt',
        'https://cdn.lufian.com/aidan-smart-gomlek-slim-fit-lacivert-klasik-gomlek-lufian-249318-15-B.jpg',
        'Shirt',
        100,
      ),
      Product(
        'White Shirt',
        'https://cdn-nau.akinon.net/products/2021/07/27/20696/1d056a25-2a63-4d2f-9eb9-53b8227ffe36_size596x596_quality100_cropCenter.jpg',
        'Shirt',
        100,
      ),
      Product(
        'Green Shirt',
        'https://floimages.mncdn.com/media/catalog/product/22-03/02/2dy51431783808-0-1646223042.jpg',
        'Shirt',
        100,
      ),
      Product(
        'Black Shirt',
        'https://cdn.lufian.com/aidan-smart-gomlek-slim-fit-lacivert-klasik-gomlek-lufian-249318-15-B.jpg',
        'Shirt',
        100,
      ),
      Product(
        'Black Shirt',
        'https://cdn.lufian.com/aidan-smart-gomlek-slim-fit-lacivert-klasik-gomlek-lufian-249318-15-B.jpg',
        'Shirt',
        100,
      ),
      Product(
        'Black Shirt',
        'https://cdn.lufian.com/aidan-smart-gomlek-slim-fit-lacivert-klasik-gomlek-lufian-249318-15-B.jpg',
        'Shirt',
        100,
      ),
    ]);

    _state = ViewState.ready;
    notifyListeners();
  }
}
