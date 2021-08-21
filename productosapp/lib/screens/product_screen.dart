import 'package:flutter/material.dart';
import 'package:productosapp/providers/product_form_provider.dart';
import 'package:provider/provider.dart';

import 'package:productosapp/services/services.dart';

import 'package:productosapp/widgets/widgets.dart';
import 'package:productosapp/ui/input_decorations.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectProduct),
      child: _ProductScreenBody(productService: productService)
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                children: [
                  ProductImage(url: productService.selectProduct.picture,),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ),

                  Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt_outlined,size: 40, color: Colors.white),
                      onPressed: () {},
                    )
                  ),

                ],
              ),
              _ProductForm(),

              SizedBox(height: 100,)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productFormProvider = Provider.of<ProductFormProvider>(context);
     final product = productFormProvider.product;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10),

              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if( value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre'
                ),
              ),

              SizedBox(height: 30 ),
                // para validacion de solo numeros: FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
              TextFormField(
                initialValue: '${product.price}',
                onChanged: (value) { 

                  if(double.tryParse(value) == null){
                    product.price = 0;
                  }else{
                    product.price = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$444', 
                  labelText: 'Precio',
                ),
              ),
              SizedBox(height: 30 ),

              SwitchListTile(
                value: product.available,
                title: Text('Disponible'), 
                activeColor: Colors.indigoAccent,
                onChanged: (value){}
              ),

              SizedBox(height: 30 ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(

    color: Colors.white12,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}