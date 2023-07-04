import 'package:flutter/material.dart';

import '../../features/products/persentation/pages/products.dart';

class Routes {
  static const String products = "/";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.products:
        return MaterialPageRoute(
          builder: (context) => const ProductsScreen(),
        );
      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}

Widget unDefineRoute() =>
    const Scaffold(body: Center(child: Text("UnDefine Route")));
