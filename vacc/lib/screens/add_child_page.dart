import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddChildPage extends StatefulWidget {
  @override
  _AddChildPageState createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();

  bool isLoading = false;

  // Function to save data
  Future<void> saveChildData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        await FirebaseFirestore.instance.collection('children').add({
          'name': nameController.text.trim(),
          'dob': dobController.text.trim(),
          'gender': genderController.text.trim(),
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Child added successfully")),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Child Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Child Name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Child Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter child name" : null,
              ),
              SizedBox(height: 15),

              // Date of Birth
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  hintText: "DD/MM/YYYY",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter date of birth" : null,
              ),
              SizedBox(height: 15),

              // Gender
              TextFormField(
                controller: genderController,
                decoration: InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter gender" : null,
              ),
              SizedBox(height: 25),

              // Save Button
              isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: saveChildData,
                        child: Text("Save"),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}