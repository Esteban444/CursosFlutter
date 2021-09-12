import 'dart:convert';

import '../customer.dart';

class CustomersResponse {
  CustomersResponse({
    required this.total,
    required this.usuarios,
  });

  int total;
  List<Customer> usuarios;

  factory CustomersResponse.fromJson(String str) =>
      CustomersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomersResponse.fromMap(Map<String, dynamic> json) =>
      CustomersResponse(
        total: json["total"],
        usuarios: List<Customer>.from(
            json["usuarios"].map((x) => Customer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}
