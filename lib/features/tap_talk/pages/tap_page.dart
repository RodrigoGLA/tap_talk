import 'package:flutter/material.dart';

class TapPage extends StatelessWidget{
  const TapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapTalk from dart page title'),
      ),
      body: const Center(
        child: Text('TapTalk from dart page body',
         style: TextStyle(fontSize: 24),),
      ),
    );
  }
}