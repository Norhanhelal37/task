import 'package:task/features/home/data/models/home_slider_model.dart';
import '../api_services/home_services.dart';

class HomeRepository {
  final HomeApiServices _homeApiServices;

  HomeRepository(this._homeApiServices);

  Future<List<SliderData>> getSliders() async {
    try {
      final response = await _homeApiServices.getSliders();
      

      List<dynamic> data = response.data['data'];
      return data.map((banner) => SliderData.fromJson(banner)).toList();
    } catch (e) {
      
      throw Exception("Failed to load banners");
    }
  }
}
