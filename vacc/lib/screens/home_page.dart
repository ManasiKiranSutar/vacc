import 'package:flutter/material.dart';
import 'add_child_page.dart';
import 'vaccination_page.dart';
import 'appointment_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget card(BuildContext context, String title, Widget page) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// Logo on top
            Image.asset("assets/images/logo.png", height: 80),

            const SizedBox(height: 20),

            card(context, "Add Child", const AddChildPage()),
            card(context, "Vaccination", const VaccinationPage()),
            card(context, "Appointments", const AppointmentPage()),
          ],
        ),
      ),
    );
  }
}