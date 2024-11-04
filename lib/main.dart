import 'package:echoes/app.dart';
import 'package:echoes/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';

void main() async {
  // Ensures that Flutter's binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize your dependencies
  await initDi();
  Bloc.observer = MyBlocObserver();
  runApp(const Echoes());
}
