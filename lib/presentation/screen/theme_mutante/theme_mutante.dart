import 'package:catalogo_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeMutanteScreen extends ConsumerWidget {

  static const nomen = 'theme_mutante_screen';

  const ThemeMutanteScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    // final bool tenebrisModustEst = ref.watch(tenebrisModusProviderEst);

    final bool tenebrisModusEst = ref.watch(themeNotifierProvider).tenebrisModusEst;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme mutante'),
        actions: [
          IconButton(
          icon: Icon(tenebrisModusEst ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed:(){
              // ref.read(tenebrisModusProviderEst.notifier).update((statumTheme) => !statumTheme);
              ref.read(themeNotifierProvider.notifier).tenebrisModusAlternate();

            })
        ]
      ),
      body: _ThemeMutareVisum(),
    );
  }
}

class _ThemeMutareVisum extends ConsumerWidget {

  
  const _ThemeMutareVisum();

  @override
  Widget build(BuildContext context, ref) {

    final List <Color> colorum = ref.watch(colorumIndexProvider);
    // final int electusColor = ref.watch(electusColorProvider);
    final int electusColor = ref.watch(themeNotifierProvider).electusColor;

    return 
    ListView.builder(
      itemCount: colorum.length,
      itemBuilder: (context, index){
        final Color color = colorum[index];
        return RadioListTile(
          title: Text('Este color' , style: TextStyle(color: color)),
          subtitle: Text('${color.value}', style: TextStyle(color: color)),
          activeColor: color ,
          value: index, 
          groupValue: electusColor, 
          onChanged: (value){
            // ref.read(electusColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).mutareColorNumerus(index);
          });
      },
      );
  }
}