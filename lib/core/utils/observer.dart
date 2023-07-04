import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class MyBlockObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print("onCreate -- bloc: ${bloc.runtimeType}");
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print("onChange -- bloc: ${bloc.runtimeType}, change: $change");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(
          "onTransition -- bloc: ${bloc.runtimeType}, transition: $transition");
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print("onError -- bloc: ${bloc.runtimeType}, error: $error");
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print("onClose -- bloc: ${bloc.runtimeType}");
    }
  }
}
