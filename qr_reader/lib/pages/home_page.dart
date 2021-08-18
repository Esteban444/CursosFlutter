import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/widgets/custom_vavigationbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:  Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context, listen: false)
                .borrarTodos();
            }, 
            icon: Icon(Icons.delete_forever),
          )
        ],
      ),
      body: _HomePageBody(),

      bottomNavigationBar: CustomNavigationBar(),

      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // obtener el selected menu opt

    final uiProvider = Provider.of<UiProvider>(context);

     // cambiar para mostrar la pagina respectiba.

    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvaider
    final scanlistProvider = Provider.of<ScanListProvider>(context, listen: false);
     
    switch (currentIndex) {
      case 0:
      scanlistProvider.cargarScanPortipo('geo');
       return MapasPage();
      case 1: 
      scanlistProvider.cargarScanPortipo('http');
       return DireccionesPage();
      default:
       return MapasPage();
    }
    
  }
}
