import 'package:flutter/material.dart';

import 'features/starwars/presentation/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starwars',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF00695c),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
