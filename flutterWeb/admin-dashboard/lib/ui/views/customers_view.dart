import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/customers_provider.dart';

import 'package:admin_dashboard/datatables/customers_datasource.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CustomersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customersProvider = Provider.of<CustomersProvider>(context);

    final customersDataSource =
        new CustomersDataSource(customersProvider.customers);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Customers View', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: customersProvider.ascending,
            sortColumnIndex: customersProvider.sortColumnIndex,
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    customersProvider.sortColumnIndex = colIndex;
                    customersProvider.sort((customer) => customer.nombre);
                  }),
              DataColumn(
                  label: Text('Email'),
                  onSort: (colIndex, _) {
                    customersProvider.sortColumnIndex = colIndex;
                    customersProvider.sort((customer) =>
                        customer.correo); // ordenar las columnas de la tabla.
                  }),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Actions')),
            ],
            source: customersDataSource,
            onPageChanged: (page) {
              // para obtener el numero de pagina
              print('page: $page');
            },
          )
        ],
      ),
    );
  }
}
