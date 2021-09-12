import 'package:admin_dashboard/models/http/customersResponse.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/customer.dart';
import 'package:admin_dashboard/api/CafeApi.dart';

class CustomersProvider extends ChangeNotifier {
  List<Customer> customers = [];
  bool isLoading = true;

  CustomersProvider() {
    this.getPaginatedCustomers();
  }

  getPaginatedCustomers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');

    final customersResponse = CustomersResponse.fromMap(response);

    this.customers = [...customersResponse.usuarios];

    isLoading = false;
    notifyListeners();
  }

  /*Future newCategory( String name) async {
    
    final data = {
      'nombre': name
    };

    try{
       final json = await CafeApi.post('/categorias', data);
       final newCategory = Categoria.fromMap(json);
       categorias.add(newCategory);

       notifyListeners();
    }catch (e) {
       throw 'Error al crear la categoria.';
    }
  }

  Future updateCategory( String id, String name) async {
    
    final data = {
      'nombre': name
    };

    try{
     await CafeApi.put('/categorias/$id', data);

      this.categorias = this.categorias.map(
         (category) {
           if(category.id != id) return category;

           category.nombre = name;
           return category;
         }
       ).toList();

      notifyListeners();

    }catch (e) {
       throw 'Eror al actulizar la categoria';
    }
  }

  Future deleteCategory( String id) async {
    

    try{
     await CafeApi.delete('/categorias/$id', {});

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();

    }catch (e) {
       throw 'Error al eliminar la categoria.';
    }
  }*/
}
