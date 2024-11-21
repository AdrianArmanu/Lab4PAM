import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/models/banner.dart';
import '../../domain/models/category.dart';
import '../../domain/models/nearby_center.dart';
import '../../domain/models/doctor.dart';
import '../../domain/usecases/usecases.dart';

class DataRepositoryImpl implements DataRepository {
  @override
  Future<List<Banner>> fetchBanners() async {
    final data = await _loadJson();
    return List<Banner>.from(data['banners'].map((x) => Banner(title: x['title'], description: x['description'])));
  }

  @override
  Future<List<Category>> fetchCategories() async {
    final data = await _loadJson();
    return List<Category>.from(data['categories'].map((x) => Category(title: x['title'], icon: x['icon'])));
  }

  @override
  Future<List<NearbyCenter>> fetchNearbyCenters() async {
    final data = await _loadJson();
    return List<NearbyCenter>.from(data['nearby_centers'].map((x) => NearbyCenter(title: x['title'], locationName: x['location_name'])));
  }

  @override
  Future<List<Doctor>> fetchDoctors() async {
    final data = await _loadJson();
    return List<Doctor>.from(data['doctors'].map((x) => Doctor(fullName: x['full_name'], typeOfDoctor: x['type_of_doctor'])));
  }

  Future<Map<String, dynamic>> _loadJson() async {
    final String response = await rootBundle.loadString('assets/v1.json');
    return json.decode(response);
  }
}
