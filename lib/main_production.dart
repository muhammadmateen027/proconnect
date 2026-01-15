import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proconnect/app/view/app.dart';
import 'package:proconnect/app/view/app_providers.dart';
import 'package:proconnect/bootstrap.dart';
import 'package:proconnect/core/config/environment.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DependencyInjector.instance.initialize(Environment.prod);

  await bootstrap(
    () => const AppProviders(child: App()),
  );
}
