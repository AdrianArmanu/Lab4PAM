import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';
import 'doctors_page.dart';

class HomePage extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data from JSON'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (value) => dataController.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banners
            Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dataController.banners.length,
              itemBuilder: (context, index) {
                final banner = dataController.banners[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(banner.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(banner.description),
                  ),
                );
              },
            )),

            // Categories (Specialties)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text('Specialties', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Obx(() => Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataController.categories.length,
                itemBuilder: (context, index) {
                  final category = dataController.categories[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_hospital),
                        SizedBox(height: 8),
                        Text(category.title),
                      ],
                    ),
                  );
                },
              ),
            )),

            // Button to view all doctors
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => DoctorsPage(doctors: dataController.doctors));
                },
                child: Text('View All Doctors'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
