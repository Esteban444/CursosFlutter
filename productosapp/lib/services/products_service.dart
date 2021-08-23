

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:productosapp/models/models.dart';


class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'flutter-varios-93334-default-rtdb.firebaseio.com';

  final List<Product> products = [];
  late Product selectProduct;

  final storage = new FlutterSecureStorage(); // Para autorizacion de las peticiones en back.

  File? newPictureFile;


  bool isloading = true;
  bool isSaving  = false;

  ProductsService() {
     this.loadProducts();
  }
  
  // peticion http get

  Future<List<Product>> loadProducts() async {

    this.isloading = true;
    notifyListeners();
     // la parte despues de products.json es para enviar token a las peticiones en firibase.
     
    final url = Uri.https(_baseUrl, 'Products.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });
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

  Future saveOrCreateProduct(Product product) async {
    isSaving = true; 
    notifyListeners();

    if(product.id == null){
      // Crear
       await this.createProduct(product);
    }else{
      // actualizar
      await this.updateProduct(product);
    }


    isSaving = false; 
    notifyListeners();
     
     
  }

  Future<String> updateProduct(Product product) async {

    final url = Uri.https(_baseUrl, 'Products/${product.id}.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });

    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

     final index = this.products.indexWhere((element) => element.id == product.id); // lineas para actualizar el producto en el formulario de productos.
     this.products[index] = product; // esta tambien.

    return product.id!;

  }

  Future<String> createProduct(Product product) async {

    final url = Uri.https(_baseUrl, 'Products/.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });

    final resp = await http.post(url, body: product.toJson());
    final decodedData =  json.decode(resp.body);
    
    product.id = decodedData['name'];
    this.products.add(product);

    return product.id!;

  }

  void updateSelectProductImage( String path) { //para actualizar la imagen en formulario productos.

   this.selectProduct.picture = path;
   this.newPictureFile = File.fromUri(Uri(path: path));

   notifyListeners();
  }

  // subir la imagen a Cloudinary
  Future<String?>  uploadImage() async {

    if(this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dqkxpcosq/image/upload?upload_preset=zhdq3gyv');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final strenamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(strenamResponse);

    this.newPictureFile = null;

    final decodeData = json.decode( resp.body);
    return decodeData['secure_url'];
  }
}