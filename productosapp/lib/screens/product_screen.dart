import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:productosapp/providers/product_form_provider.dart';

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

    final productFormProvidaer = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body:  SingleChildScrollView(
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //ocultar el teclado cuando haga scrooll
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
                  // codigo boton tomar fotos para el producto.
                  Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt_outlined,size: 40, color: Colors.white),
                      onPressed: () async {
                        final picker = new ImagePicker();
                        final XFile?  pickedFile = await picker.pickImage(
                          source: ImageSource.camera,
                          imageQuality: 100
                        );

                        if(pickedFile == null) return;

                        productService.updateSelectProductImage(pickedFile.path);
                      },
                    )
                  ),

                ],
              ),
              _ProductForm(),

              SizedBox(height: 100,)
            ],
          ),
        ),
        
        // Para grabar productos
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
        child: productService.isSaving
         ? CircularProgressIndicator(color: Colors.white,)
         : Icon(Icons.save_outlined),
        onPressed: productService.isSaving 
          ? null
          :() async {
          if( !productFormProvidaer.isValidForm() ) return;

          final String? imageUrl = await productService.uploadImage();

          if (imageUrl != null) productFormProvidaer.product.picture = imageUrl;

          await productService.saveOrCreateProduct(productFormProvidaer.product);
        },
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
          key: productFormProvider.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
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
                onChanged: (value) => productFormProvider.updateAvailability(value) // o productFormProvider.updateAvailability y funciona igual.
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