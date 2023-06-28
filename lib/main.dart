import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('AppDataBase');
  // Hive.registerAdapter(ThemeData());
  runApp(const ProviderScope(child: MyApp()));
}
