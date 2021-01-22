import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  // fazer sempre uma cópia da lista original
  List<Product> get items => [..._items];

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  // ao fazer alguma mudança na classe, todos os liteners devem ser notificados
  void addProdcusts(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
