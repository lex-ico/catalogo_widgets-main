import 'package:catalogo_widgets/config/menu/menu_item.dart';
import 'package:catalogo_widgets/presentation/widgets/lateralis_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DomusScreen extends StatelessWidget {
  static const String nomen = "domus_screen";

  const DomusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //crear una referencia a el menu lateral la key:
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey ,
      appBar: AppBar(
        title: const Text('Flutter + Material13'),
      ),
      body: const _DomusView(),
      //menu lateral:
      drawer: LateralisMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _DomusView extends StatelessWidget {
  const _DomusView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _PropriumListTile(menuItem: menuItem);
      },
    );
  }
}

class _PropriumListTile extends StatelessWidget {
  const _PropriumListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colorum = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(menuItem.titulus),
      subtitle: Text(menuItem.subTitulus),
      leading: Icon(
        menuItem.icon,
        color: colorum.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colorum.primary,
      ),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
