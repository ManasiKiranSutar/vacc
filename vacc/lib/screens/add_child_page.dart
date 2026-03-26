import 'package:flutter/material.dart';

class AddChildPage extends StatefulWidget {
  const AddChildPage({Key? key}) : super(key: key);

  @override
  State<AddChildPage> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();

  Widget inputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void saveData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Child Data Saved")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        title: const Text("Add Child"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            inputField("Child Name", nameController),
            inputField("Date of Birth", dobController),
            inputField("Gender", genderController),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: saveData,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}