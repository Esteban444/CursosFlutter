import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:admin_dashboard/api/CafeApi.dart';

import 'package:admin_dashboard/models/customer.dart';

class CustomerFormProvider extends ChangeNotifier {
  Customer? customer;
  late GlobalKey<FormState> formKey;

  //  Como actualizar el usuario del provider

  /* void udateListener() {
    notifyListeners();
  }*/

  copyCustomerWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    customer = new Customer(
      rol: rol ?? this.customer!.rol,
      estado: estado ?? this.customer!.estado,
      google: google ?? this.customer!.google,
      nombre: nombre ?? this.customer!.nombre,
      correo: correo ?? this.customer!.correo,
      uid: uid ?? this.customer!.uid,
      img: img ?? this.customer!.img,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future updateCustomer() async {
    if (!this._validForm()) return false;

    final data = {
      'nombre': customer!.nombre,
      'correo': customer!.correo,
    };

    try {
      final resp = await CafeApi.put('/usuarios/${customer!.uid}', data);
      print(resp);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Customer> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await CafeApi.uploadFile(path, bytes);
      customer = Customer.fromMap(resp);
      notifyListeners();

      return customer!;
    } catch (e) {
      throw 'Error en profile provider';
    }
  }
}
