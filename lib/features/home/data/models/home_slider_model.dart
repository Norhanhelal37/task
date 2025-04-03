
import 'package:json_annotation/json_annotation.dart';

part  'home_slider_model.g.dart';


@JsonSerializable()
class HomeSliderModel {
  final String message;
  final int status;
  final SliderData data;

  HomeSliderModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) =>
      _$HomeSliderModelFromJson(json);

}


@JsonSerializable()
class SliderData {
  final int id;
  final String image;

  SliderData({
    required this.id,
    required this.image,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) =>
      _$SliderDataFromJson(json);


}