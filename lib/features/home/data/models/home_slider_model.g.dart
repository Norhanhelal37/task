// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSliderModel _$HomeSliderModelFromJson(Map<String, dynamic> json) =>
    HomeSliderModel(
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
      data: SliderData.fromJson(json['data'] as Map<String, dynamic>),
    );



SliderData _$SliderDataFromJson(Map<String, dynamic> json) => SliderData(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
    );


