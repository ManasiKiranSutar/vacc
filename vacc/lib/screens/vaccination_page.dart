import 'package:flutter/material.dart';

class VaccinationPage extends StatelessWidget {
  const VaccinationPage({Key? key}) : super(key: key);

  Widget card(String name, String time) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(time),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vaccination")),
      body: ListView(
        children: [
          card("BCG", "At Birth"),
          card("Polio", "6 Weeks"),
        ],
      ),
    );
  }
}