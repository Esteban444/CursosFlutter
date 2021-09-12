import 'dart:convert';

class Customer {
  Customer(
      {required this.rol,
      required this.estado,
      required this.google,
      required this.nombre,
      required this.correo,
      required this.uid,
      this.img});

  String rol;
  bool estado;
  bool google;
  String nombre;
  String correo;
  String uid;
  String? img;

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        nombre: json["nombre"],
        correo: json["correo"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "uid": uid,
      };
}
