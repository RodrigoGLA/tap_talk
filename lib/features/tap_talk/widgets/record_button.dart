import 'package:flutter/material.dart';
import 'package:tap_talk/features/tap_talk/services/audio_service.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({super.key});

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  bool _isRecording = false;

  void _startRecording() async {
    setState(() => _isRecording = true);
    await AudioService.instance.startRecording();
  }

  void _stopRecording() async {
    await AudioService.instance.stopRecording();
    setState(() => _isRecording = false);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Grabación guardada: ${AudioService.instance.lastRecordPath}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _startRecording,
      onLongPressUp: _stopRecording,
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
    );
  }
}