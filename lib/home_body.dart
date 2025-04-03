import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/cart/cart_view.dart';
import 'package:task/features/home/home_view.dart';
import 'package:task/features/home/logic/home_cubit.dart';
import 'package:task/features/more_settings/more_settings_view.dart';
import 'package:task/features/projects/projects_view.dart';
import 'package:task/features/works/works_view.dart';
import 'package:task/navigation_bar.dart';

import 'core/di/dependencies.dart';
import 'features/home/data/repo/home_repo.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final List<Widget> _screens = [
    HomeView(),
    CartView(),
    ProjectsView(),
    WorksView(),
    MoreSettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<HomeCubit>(
          
      create: (context) => HomeCubit(sl<HomeRepository>()),
      child: Scaffold(
        bottomNavigationBar: CustomeNavigationBar(
          index: _selectedIndex,
        ),
        body: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, value, child) {
              return _screens[_selectedIndex.value];
            }),
      ),
    ));
  }
}
