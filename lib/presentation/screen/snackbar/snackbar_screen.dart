import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const nomen = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void viderePropriumSnackbar( BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Okay!', onPressed: () {},),
      duration: const Duration(seconds: 2),

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void apertaDialogo(BuildContext context){
    showDialog(
      context: context, 
      //para que no se pueda salir dandole fuera de la caja de dialogo
      barrierDismissible: false,
      builder:(context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Ad esse dolore est labore fugiat ut. Commodo aliqua irure Lorem consequat tempor culpa amet esse labore. Laboris non incididunt officia est dolore officia tempor minim dolor tempor occaecat qui aliqua cillum. Aliquip consequat dolor laborum est deserunt duis commodo deserunt excepteur aliqua.'),
        actions: [
          //importado de go_route para salir con el boton:
          TextButton(onPressed: () => context.pop(), child: const Text ('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text ('Aceptar')),
          
        ],
      ), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
        ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                      const Text('Est nostrud cupidatat pariatur dolore aliqua voluptate fugiat irure velit veniam officia nostrud laborum. Pariatur dolore ea esse ut laborum. Qui voluptate pariatur tempor incididunt ad adipisicing. Duis tempor cillum id irure minim ad id enim.')
                  ],
                  );
              },
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => apertaDialogo(context), 
              child: const Text('Mostrar diálogo'))

          ]
         ),
        ),
      //extended cuando queremos que el boton tenga un label + un icono
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'), 
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => viderePropriumSnackbar(context)
      ),
    );
  }
}