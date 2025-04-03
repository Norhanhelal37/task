import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/models/home_slider_model.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  Future<List<SliderData>> fetchSliders() async {
    emit(HomeLoading());
    try {
      final banners = await _homeRepository.getSliders();
      log(banners.toString());
      emit(HomeSuccess(data:banners));
      return banners;
    } catch (e) {
      emit(HomeFailure(e.toString()));
      throw Exception('Failed to fetch sliders');
    }
  }
}
