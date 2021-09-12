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
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Actions')),
            ],
            source: customersDataSource,
          )
        ],
      ),
    );
  }
}
