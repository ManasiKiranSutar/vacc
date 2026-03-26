import 'package:flutter/material.dart';
import 'add_child_page.dart';
import 'vaccination_page.dart';
import 'appointment_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _card(context, "Add Child", Icons.child_care, const AddChildPage()),
            _card(context, "Vaccination Schedule", Icons.medical_services, const VaccinationPage()),
            _card(context, "Appointments", Icons.event, const AppointmentPage()),
          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF6C63FF)),
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
}