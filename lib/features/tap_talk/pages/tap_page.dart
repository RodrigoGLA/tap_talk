import 'package:flutter/material.dart';
import 'package:tap_talk/features/tap_talk/widgets/record_button.dart';

class TapPage extends StatelessWidget {
  const TapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TapTalk')),
      body: const Center(
        child: RecordButton(),
      ),
    );
  }
}