
import 'package:catalogo_widgets/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tenebrisModusProviderEst = StateProvider((ref) => false);
final colorumIndexProvider = Provider((ref) => colorum);
final electusColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier , AppTheme>(
  (ref) => ThemeNotifier());



  class ThemeNotifier extends StateNotifier <AppTheme> {
  ThemeNotifier():super(AppTheme());

  void tenebrisModusAlternate() {

    state = state.copyWith( tenebrisModusEst: !state.tenebrisModusEst);
  }
  
  void mutareColorNumerus ( int colorNumerus ){

    state = state.copyWith( electusColor : colorNumerus); 
  }

}
