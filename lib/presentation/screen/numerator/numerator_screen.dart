import 'package:catalogo_widgets/presentation/providers/numerator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';

//riverpod se puede utilizar en un statelesswidget pero hay que cambiar el nombre a ConsumerWidget y luego importar RiverPod
//añadir ref en el build (... context, WidgetRef ref)

class NumeratorScreen extends ConsumerWidget {

    static const String nomen = "numerator_screen";

  const NumeratorScreen({super.key});

  @override
  Widget build (BuildContext context, WidgetRef ref) {

    final int clickNumerator = ref.watch(numeratorProvider);

    // final bool tenebrisModusEst = ref.watch(tenebrisModusProviderEst);
    final bool tenebrisModusEst = ref.watch(themeNotifierProvider).tenebrisModusEst;
    //

    return Scaffold(
      appBar: AppBar(
        title: const Text('Numerator Screen'),
        actions: [
          IconButton(
          onPressed:(){
          ref.read(themeNotifierProvider.notifier).tenebrisModusAlternate();
          }, 
          icon: Icon(tenebrisModusEst ? Icons.dark_mode_outlined : Icons.light_mode_outlined)
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickNumerator', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon (Icons.add),
        onPressed: (){
          ref.read(numeratorProvider.notifier).state++;
          // ref.read(numeratorProvider.notifier)
          // .update((state)=> state +1);
        },
      ),
    );
  }
}