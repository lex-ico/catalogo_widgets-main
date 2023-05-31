import 'package:flutter/material.dart';

class MenuItem {
  final String titulus;
  final String subTitulus;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.titulus,
      required this.subTitulus,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      titulus: 'Riverpod Numerator',
      subTitulus: 'Introduccion a Riverpod',
      link: '/numerator-river',
      icon: Icons.add),
  MenuItem(
      titulus: 'Botones',
      subTitulus: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      titulus: 'Tarjetas',
      subTitulus: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      titulus: 'Progress Indicators',
      subTitulus: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      titulus: 'Snackbars y diálogos',
      subTitulus: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      titulus: 'Animated container',
      subTitulus: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      titulus: 'UI Controls + Tiles',
      subTitulus: 'Una serie de controles de Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      titulus: 'Introducción a la aplicación',
      subTitulus: 'Pequeño tutorial introductorio',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  MenuItem(
      titulus: 'InfiniteScroll y Pull',
      subTitulus: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
  MenuItem(
      titulus: 'Cambiar tema',
      subTitulus: 'Cambiar tema de la aplicación',
      link: '/theme-mutante',
      icon: Icons.color_lens_outlined),
];
