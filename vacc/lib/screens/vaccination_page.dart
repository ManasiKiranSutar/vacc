import 'package:flutter/material.dart';

class VaccinationPage extends StatelessWidget {
  const VaccinationPage({Key? key}) : super(key: key);

  Widget vaccineCard(String name, String age, String desc) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.medical_services, color: Color(0xFF6C63FF)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$age\n$desc"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        title: const Text("Vaccination Schedule"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          vaccineCard("BCG", "At Birth", "Prevents Tuberculosis"),
          vaccineCard("Polio", "6 Weeks", "Prevents Polio"),
          vaccineCard("DPT", "10 Weeks", "Diphtheria, Tetanus"),
          vaccineCard("Hepatitis B", "6 Weeks", "Liver protection"),
          vaccineCard("Measles", "9 Months", "Prevents Measles"),
        ],
      ),
    );
  }
}