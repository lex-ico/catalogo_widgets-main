import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const nomen = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls Container'),
        ),
      body: _UIControlsVisum(),
    );
  }
}

class _UIControlsVisum extends StatefulWidget {
  const _UIControlsVisum();

  @override
  State<_UIControlsVisum> createState() => _UIControlsVisumState();
}

enum Transportatio {coche, avion, barco, submarino}

class _UIControlsVisumState extends State<_UIControlsVisum> {

  bool developerEst = true;

  bool eamusAdPrandete = false;
  bool eamusAdPrandium = false;
  bool eamusAdCena = false;

  Transportatio eligereTransportatio = Transportatio.coche;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: developerEst, 
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          onChanged: (value) => setState(() {
              developerEst = !developerEst;
            })
          ,
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$eligereTransportatio'),
          children: [
          //COCHE
              RadioListTile(
                title: const Text('Coche'),
                subtitle: const Text('Viajar en coche'),
                value: Transportatio.coche, 
                groupValue: eligereTransportatio, 
                onChanged: (value) => setState(() {
                    eligereTransportatio = Transportatio.coche;
                  }),
              ),
              //AVION
              RadioListTile(
                title: const Text('Avión'),
                subtitle: const Text('Viajar en avión'),
                value: Transportatio.avion, 
                groupValue: eligereTransportatio, 
                onChanged: (value) => setState(() {
                    eligereTransportatio = Transportatio.avion;
                  }),
              ),
              //BARCO
              RadioListTile(
                title: const Text('Barco'),
                subtitle: const Text('Viajar en barco'),
                value: Transportatio.barco, 
                groupValue: eligereTransportatio, 
                onChanged: (value) => setState(() {
                    eligereTransportatio = Transportatio.barco;
                  }),
              ),
              //SUBMARINO
              RadioListTile(
                title: const Text('Submarino'),
                subtitle: const Text('Viajar en submarino'),
                value: Transportatio.submarino, 
                groupValue: eligereTransportatio, 
                onChanged: (value) => setState(() {
                    eligereTransportatio = Transportatio.submarino;
                  }),
              ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: eamusAdPrandete, 
          onChanged: (value) => setState(() {
            eamusAdPrandete = !eamusAdPrandete;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Comida?'),
          value: eamusAdPrandium, 
          onChanged: (value) => setState(() {
            eamusAdPrandium = !eamusAdPrandium;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: eamusAdCena, 
          onChanged: (value) => setState(() {
            eamusAdCena = !eamusAdCena;
          }),
        ),
      ],
    );
  }
}