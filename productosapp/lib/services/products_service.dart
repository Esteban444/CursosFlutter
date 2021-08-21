

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:productosapp/models/models.dart';

import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'flutter-varios-93334-default-rtdb.firebaseio.com';

  final List<Product> products = [];
  late Product selectProduct;


  bool isloading = true;

  ProductsService() {
     this.loadProducts();
  }
  
  Future<List<Product>> loadProducts() async {

    this.isloading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);
    
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });
    
    this.isloading = false;
    notifyListeners();

    return this.products;
  }
}