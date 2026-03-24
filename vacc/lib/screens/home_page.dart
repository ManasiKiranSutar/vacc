import 'package:flutter/material.dart';
import 'add_child_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: Icon(Icons.child_care),
                title: Text("Add Child"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => AddChildPage()),
  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Vaccination Schedule"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.event),
                title: Text("Appointments"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}