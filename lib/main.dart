import 'package:flutter/material.dart';

import 'app.dart';
import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();

  runApp(const MyApp());
}
