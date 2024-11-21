import 'package:flutter/material.dart';
import '../../domain/models/doctor.dart';

class DoctorsPage extends StatelessWidget {
  final List<Doctor> doctors;

  DoctorsPage({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctors')),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(doctor.fullName, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(doctor.typeOfDoctor),
            ),
          );
        },
      ),
    );
  }
}
