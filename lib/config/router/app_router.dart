import 'package:catalogo_widgets/presentation/screen/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: DomusScreen.nomen,
    builder: (context, state) => const DomusScreen(),
  ),
  GoRoute(
    path: "/buttons",
    name: ButtonsScreen.nomen,
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: "/cards",
    name: CardsScreen.nomen,
    builder: (context, state) => const CardsScreen(),
  ),

    GoRoute(
    path: "/progress",
    name: ProgressScreen.nomen,
    builder: (context, state) => const ProgressScreen(),
  ),

  GoRoute(
    path: "/numerator-river",
    name: NumeratorScreen.nomen,
    builder: (context, state) => const NumeratorScreen(),
  ),
    GoRoute(
    path: "/theme-mutante",
    name: ThemeMutanteScreen.nomen,
    builder: (context, state) => const ThemeMutanteScreen(),
  ),

    GoRoute(
    path: "/animated",
    name: AnimatumScreen.nomen,
    builder: (context, state) => const AnimatumScreen(),
  ),

    GoRoute(
    path: "/tutorial",
    name: DoceboAppScreen.nomen,
    builder: (context, state) => const DoceboAppScreen(),
  ),
    
    GoRoute(
    path: "/infinite",
    name: InfiniteScrollScreen.nomen,
    builder: (context, state) => const InfiniteScrollScreen(),
  ),

    GoRoute(
    path: "/snackbars",
    name: SnackbarScreen.nomen,
    builder: (context, state) => const SnackbarScreen(),
  ),

    GoRoute(
    path: "/ui-controls",
    name: UiControlsScreen.nomen,
    builder: (context, state) => const UiControlsScreen(),
  ),



]);

///theme-mutante