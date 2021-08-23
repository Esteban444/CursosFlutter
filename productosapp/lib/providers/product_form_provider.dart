
import 'package:flutter/material.dart';
import 'package:productosapp/models/models.dart';


class ProductFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

  updateAvailability(bool value){
    this.product.available = value;
    notifyListeners();
  }

  bool isValidForm(){


    return formkey.currentState?.validate() ?? false;
  }
}