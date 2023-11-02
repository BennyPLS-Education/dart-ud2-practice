import 'package:flutter/material.dart';

import '../dataclass/persona.dart';
import '../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super(key: null);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleStyle = const TextStyle(fontSize: 50);
  Persona persona = Persona.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('SPPMMD'),
        actions: [
          _profile(),
        ],
      ),
      body: Center(
        child: Text('HOME PAGE', style: titleStyle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(15),
        child: _navigationButtons(),
      ),
    );
  }

  /// The Floating buttons for navigation
  ///
  /// First button is for going to Personal page
  /// Second button is for going to Widgets page
  Widget _navigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton.extended(
          heroTag: 'Personal',
          icon: const Icon(Icons.person),
          label: const Text('Personal'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              Location.personal.path,
              arguments: persona,
            ).then((value) => setState(() => persona = value as Persona));
          },
        ),
        FloatingActionButton.extended(
          heroTag: 'Widgets',
          icon: const Icon(Icons.widgets),
          label: const Text('Widgets'),
          onPressed: () {
            Navigator.pushNamed(context, Location.widgets.path);
          },
        ),
      ],
    );
  }

  /// Profile Widget
  ///
  /// This shows the initials of the person in a circle avatar.
  Widget _profile() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Text(persona.initials),
      ),
    );
  }
}
