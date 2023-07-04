import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/observer.dart';

void main() {
  Bloc.observer = MyBlockObserver();
  runApp(const MyApp());
}
