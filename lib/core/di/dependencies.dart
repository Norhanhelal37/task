import 'package:get_it/get_it.dart';
import 'package:task/core/helpers/shared_pref.dart';
import 'package:task/core/networking/dio_factory.dart';
import 'package:task/core/networking/api_services.dart';


import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/logic/auth_cubit.dart';
import '../../features/home/data/api_services/home_services.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/home_cubit.dart';

final sl = GetIt.instance; 

void setupLocator() {

  sl.registerLazySingleton<DioFactory>(() => DioFactory());
  sl.registerLazySingleton<SharedPreferencesService>(() => SharedPreferencesService());

  sl.registerLazySingleton<ApiServices>(() => ApiServices());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl<ApiServices>()));

  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepository>(),sl<SharedPreferencesService>()));


   sl.registerLazySingleton<HomeApiServices>(() => HomeApiServices());
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository(sl<HomeApiServices>()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepository>()));
}
