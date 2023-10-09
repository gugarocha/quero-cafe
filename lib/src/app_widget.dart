import 'package:flutter/material.dart';

import 'core/ui/app_theme.dart';
import 'features/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quero Café',
      theme: AppTheme.themeData,
      routes: {
        '/': (_) => const HomePage(),
      },
    );
  }
}
