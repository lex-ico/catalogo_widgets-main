import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {"elevation": 0.0, "label": "Elevation 0"},
  {"elevation": 1.0, "label": "Elevation 1"},
  {"elevation": 2.0, "label": "Elevation 2"},
  {"elevation": 3.0, "label": "Elevation 3"},
  {"elevation": 4.0, "label": "Elevation 4"},
  {"elevation": 5.0, "label": "Elevation 5"},
];

class CardsScreen extends StatelessWidget {
  static const String nomen = "cards_screen";

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardSpecies1(
              pittacium: card["label"], elevatio: card["elevation"])),
          ...cards.map((card) => _CardSpecies2(
              pittacium: card["label"], elevatio: card["elevation"])),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class _CardSpecies1 extends StatelessWidget {
  final String pittacium;
  final double elevatio;

  const _CardSpecies1(
      {super.key, required this.pittacium, required this.elevatio});

  @override
  Widget build(BuildContext context) {
    final colorum = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: colorum.outlineVariant)),
      elevation: elevatio,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(pittacium),
          ),
        ]),
      ),
    );
  }
}

class _CardSpecies2 extends StatelessWidget {
  final String pittacium;
  final double elevatio;

  const _CardSpecies2(
      {super.key, required this.pittacium, required this.elevatio});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevatio,
      child: Stack(children: [
        Image.network(
          "https://picsum.photos/id/${elevatio.toInt() * 10}/600/350",
          height: 350,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20))),
            child: IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {},
            ),
          ),
        )
      ]),
    );
  }
}
