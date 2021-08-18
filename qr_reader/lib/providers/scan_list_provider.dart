
import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';


class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  Future<ScanModel>nuevoScan(String valor) async {

    final nuevoScan = new ScanModel(valor: valor);

    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // asignar el id de la base de datos al modelo
    nuevoScan.id = id;
    if(this.tipoSeleccionado == nuevoScan.tipo){
    this.scans.add(nuevoScan);
    notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async{

    final scans = await DBProvider.db.getScans();
    this.scans = [... scans];
    notifyListeners();
  }

  cargarScanPortipo( String tipo) async {

    final scan = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [... scan];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
     await DBProvider.db.deleteAllScan();
     this.scans = [];
     notifyListeners();
  }

  borrarScanPorId(int id) async {

     await DBProvider.db.deleteScan(id);
     //this.cargarScanPortipo(this.tipoSeleccionado);
  }
}