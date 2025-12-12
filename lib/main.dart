import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/tap_talk/pages/tap_page.dart';

void main() {
  runApp(const TapTalkApp());
}

class TapTalkApp extends StatelessWidget {
  const TapTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TapTalk',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const TapPage(),
    );
  }
}