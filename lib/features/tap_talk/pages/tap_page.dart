import 'package:flutter/material.dart';
import 'package:tap_talk/features/tap_talk/services/audio_service.dart';

class TapPage extends StatefulWidget {
  const TapPage({super.key});

  @override
  State<TapPage> createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TapTalk from dart page title')),
      body: Center(
        child: GestureDetector(
          onLongPress: () async {
            setState(() => _isRecording = true);
            await AudioService.instance.startRecording();
          },
          onLongPressUp: () async {
            await AudioService.instance.stopRecording();
            setState(() => _isRecording = false,);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Grabacion guardada: ${AudioService.instance.lastRecordPath}',
                ),
              )
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: _isRecording ? Colors.red : Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isRecording ? Icons.mic : Icons.mic_none,
              color: Colors.white,
              size: 48,
            ),
          ),
        ),
      ),
    );
  }
}
