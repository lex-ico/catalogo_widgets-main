import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const nomen = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imaginesIds = [1,2,3,4,5];

//esta cargando?:
  bool oneratusEst = false;
//
  bool factumEst = true;

  final ScrollController scrollController = ScrollController();

  void quinceImaginesAddo(){
    final finalisId = imaginesIds.last; //este elemento seria el 5

    // imaginesIds.add(finalisId + 1);
    // imaginesIds.add(finalisId + 2);
    // imaginesIds.add(finalisId + 3);
    // imaginesIds.add(finalisId + 4);
    // imaginesIds.add(finalisId + 5);

    imaginesIds.addAll([1,2,3,4,5].map((e) => finalisId + e ) );
  }

//se ejecuta nada mas entrar
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      //si la posision mas 500 pixeles es mayor o igual a la posicion final haz x
      if (scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent){
        vadeProximamPagina();
      }
    });
  }

//al salir se desactiva el scroll
  @override
  void dispose() {
    scrollController.dispose();
    factumEst = false;
    super.dispose();
  }



  Future vadeProximamPagina() async {
    //if (oneratusEst === true)
    //si esta cargando no sigas haz un return 
    if (oneratusEst) return;
  //si no esta cargando haz:
    oneratusEst = true;

    await Future.delayed(const Duration(seconds: 2));

    quinceImaginesAddo();

    oneratusEst = false;

// para que no se rompa la app
// para que se acabe de redibujar en el setstate
    if (!factumEst) return;
 //para redibujarse 
    setState(() { });
// esto hace que se ejecute la animación de reload de un salto
    movereScrollAdDescendit();
  }

  Future<void> cumRenovat() async{

    oneratusEst = true;
    setState(() { });

    await Future.delayed(const Duration(seconds: 3));

    if ( !factumEst ) return;
    oneratusEst = false;

    final finalisId = imaginesIds.last;

    imaginesIds.clear();
    imaginesIds.add(finalisId + 1);
    quinceImaginesAddo();

   //para que se actualice
    setState(() { });
  }

  //mover el scroll para abajo
  void movereScrollAdDescendit(){
    //si se da esta circunstancia sale
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent)return;
    // si no se da esta circunstancia entra:    
      scrollController.animateTo(
          scrollController.position.pixels + 120, 
          duration: const Duration(milliseconds: 300), 
          curve: Curves.fastOutSlowIn
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll Container'),
      //   ),
      //
      backgroundColor: Colors.black,
      //
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,

        child: RefreshIndicator(
          onRefresh: cumRenovat,
          edgeOffset: 10,
          child: ListView.builder(
            controller:scrollController,
            itemCount: imaginesIds.length,
            itemBuilder:(context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${ imaginesIds[index] }/500/300'),
                fit: BoxFit.cover,
                );
             },
          ),
        ),
      ),

      //
      floatingActionButton: FloatingActionButton(
        onPressed:() => context.pop(),
        child: oneratusEst //si esta cargando:
        ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded))
          //si no esta cargando, el default:
        : FadeIn(child: const Icon (Icons.arrow_back_ios_new_outlined)),
        // ,
        // 
        ),
      //
    );
  }
}