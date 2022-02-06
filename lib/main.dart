import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_locator.dart';
import 'app_widget.dart';
import 'common/core/api/http_overrides.dart';
import 'common/core/bloc_observer/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  unawaited(getItInit());

  BlocOverrides.runZoned(
    () => runApp(const AppWidget()),
    blocObserver: SimpleBlocObserver(),
  );
}
