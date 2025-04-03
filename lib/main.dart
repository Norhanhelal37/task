import 'package:flutter/material.dart';
import 'package:task/abf_app.dart';

import 'core/di/dependencies.dart';
import 'core/helpers/shared_pref.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().initialize();

  setupLocator();
  runApp(
    AbfApp(),
  );
}
