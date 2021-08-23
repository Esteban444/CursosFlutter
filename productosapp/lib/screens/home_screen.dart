import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productosapp/screens/screens.dart';

import 'package:productosapp/services/services.dart';

import 'package:productosapp/models/models.dart';
import 'package:productosapp/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    
    if( productsService.isloading ) return LoadingScreen();


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {

            productsService.selectProduct = productsService.products[index].copy(); // para crear copia del producto con el metodo copy del modelo
            Navigator.pushNamed(context, 'product');
          },
          child: ProducCard(
            product: productsService.products[index],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          // guardar al crear un nuevo producto.

          productsService.selectProduct = new Product(
            available: false, 
            name: '', 
            price: 0
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
   );
  }
}