import 'package:admin_dashboard/models/http/customersResponse.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/customer.dart';
import 'package:admin_dashboard/api/CafeApi.dart';

class CustomersProvider extends ChangeNotifier {
  List<Customer> customers = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

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

  Future<Customer?> getCustomerById(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');

      final customer = Customer.fromMap(response);
      return customer;
    } catch (e) {
      return null;
    }
  }

  // Funcion para organizar las columnas de la tabla
  void sort<T>(Comparable<T> Function(Customer customer) getField) {
    customers.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }

  void refreshCustomers(Customer newCustomer) {
    this.customers = this.customers.map((customer) {
      if (customer.uid == newCustomer.uid) {
        customer = newCustomer;
      }
      return customer;
    }).toList();
    notifyListeners();
  }
}
