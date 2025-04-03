import 'package:dio/dio.dart';
import 'package:task/core/networking/api_constant.dart';
import '../../../../core/networking/dio_factory.dart';

class HomeApiServices {
  static final Dio _dio = DioFactory.getDio();

  HomeApiServices();

  Future<Response> getSliders() async {
    try {
      final response = await _dio.get(ApiConstant.homeSlider);
      
      

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to fetch sliders: ${response.statusMessage}");
      }
    } catch (e) {
      
      rethrow;
    }
  }
}
