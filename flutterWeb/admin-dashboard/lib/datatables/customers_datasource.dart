import 'package:flutter/material.dart';

import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/models/customer.dart';

class CustomersDataSource extends DataTableSource {
  final List<Customer> customers;

  CustomersDataSource(this.customers);

  @override
  DataRow getRow(int index) {
    final Customer customer = customers[index];

    /*final image =
        Image(image: AssetImage('assets/no-image.jpg'), width: 35, height: 35);*/

    final img = (customer.img == null)
        ? Image(
            image: AssetImage('no-image.jpg'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif',
            image: customer.img!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(
        child: img,
      )),
      DataCell(Text(customer.nombre)),
      DataCell(Text(customer.correo)),
      DataCell(Text(customer.uid)),
      DataCell(
        IconButton(
          icon: Icon(Icons.edit_outlined),
          onPressed: () {
            NavigationService.replaceTo(
                '/dashboard/customer/${customer.uid}'); // para navegar al usuario selecionado en la tabla.
          },
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => customers.length;

  @override
  int get selectedRowCount => 0;
}
