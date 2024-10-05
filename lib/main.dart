import 'package:app_with_clean_arch/app/app.dart';
import 'package:app_with_clean_arch/app/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
