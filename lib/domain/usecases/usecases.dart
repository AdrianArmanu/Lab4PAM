import '../models/banner.dart';
import '../models/category.dart';
import '../models/nearby_center.dart';
import '../models/doctor.dart';

abstract class DataRepository {
  Future<List<Banner>> fetchBanners();
  Future<List<Category>> fetchCategories();
  Future<List<NearbyCenter>> fetchNearbyCenters();
  Future<List<Doctor>> fetchDoctors();
}
