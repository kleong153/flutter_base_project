import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/root_app.dart';
import 'package:flutter_base_project/utils/build_environment.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    Fimber.plantTree(DebugTree());
  }

  // Init env/config.
  BuildEnvironment.init(
    baseUrl: '',
  );
  assert(env != null);

  runApp(RootApp());
}
