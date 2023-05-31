import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RevelareInfo{
  final String titulus;
  final String caption;
  final String imagoUrl;

  RevelareInfo(this.titulus, this.caption, this.imagoUrl);

}
// instancia de la clase de RevelareInfo
final revelationes = <RevelareInfo>[
  RevelareInfo('Busca la comida', 'Ut ipsum nisi elit in.', 'assets/images/1.png'),
  RevelareInfo('Entrega rápida', 'Minim et mollit nulla cupidatat consectetur.', 'assets/images/2.png'),
  RevelareInfo('Disfruta tu comida', 'Deserunt ullamco commodo elit amet aliqua duis aliquip minim in enim eiusmod ipsum qui duis.', 'assets/images/3.png'),
];

class DoceboAppScreen extends StatefulWidget {

  static const nomen = 'tutorial_screen';
  const DoceboAppScreen({super.key});

  @override
  State<DoceboAppScreen> createState() => _DoceboAppScreenState();
}

class _DoceboAppScreenState extends State<DoceboAppScreen> {

  final PageController pageviewController = PageController();

  bool finemPervenit = false;

  @override
  void initState() {

    pageviewController.addListener(() {
      // print('${pageviewController.page}');

      final pagina = pageviewController.page ?? 0;

      if ( !finemPervenit && pagina >= (revelationes.length - 1.5)){
        setState(() {
          finemPervenit = true;
        });
      }

     });

    super.initState();
  }
  //para limpiar el listener al salir de la app

@override 
void dispose(){
  pageviewController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

            PageView(
              //el controlador del page
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: revelationes.map((element) => _Revelatione(
                titulus: element.titulus,
                caption: element.caption,
                imagoUrl: element.imagoUrl,
              )).toList(),
            ),

            Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              ),
            ),
            
            //si... x es verdadero tal
            finemPervenit ?
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                // delay: const Duration(seconds: 0),
                child: FilledButton(
                  
                  child: const Text('Comenzar'),
                  onPressed: () => context.pop(),
                  
                ),
              )
              // sino muestra una caja
            ) : const SizedBox()

        ],
      ),
    );
  }
}

class _Revelatione extends StatelessWidget {

  final String titulus;
  final String caption;
  final String imagoUrl;

  const _Revelatione({

    required this.titulus, 
    required this.caption, 
    required this.imagoUrl

    });

  @override
  Widget build(BuildContext context) {

    final stiloTitulus = Theme.of(context).textTheme.titleLarge;
    final stiloCaption = Theme.of(context).textTheme.bodySmall;

    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          //para encontrar la imagen local
          Image(image: AssetImage(imagoUrl)),
          const SizedBox(height: 20),
          Text(titulus, style: stiloTitulus),
          const SizedBox(height: 10),
          Text(caption, style: stiloCaption),

         ]
       ),
      )
    );

  }
}