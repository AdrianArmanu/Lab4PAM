import 'package:get/get.dart';
import '../../domain/models/banner.dart';
import '../../domain/models/category.dart';
import '../../domain/models/nearby_center.dart';
import '../../domain/models/doctor.dart';
import '../../data/repositories/data_repository_impl.dart';

class DataController extends GetxController {
  final repository = DataRepositoryImpl();

  var banners = <Banner>[].obs;
  var categories = <Category>[].obs;
  var nearbyCenters = <NearbyCenter>[].obs;
  var doctors = <Doctor>[].obs;

  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    banners.value = await repository.fetchBanners();
    categories.value = await repository.fetchCategories();
    nearbyCenters.value = await repository.fetchNearbyCenters();
    doctors.value = await repository.fetchDoctors();
  }
}
