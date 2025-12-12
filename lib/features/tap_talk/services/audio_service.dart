// audio_service.dart
import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tap_talk/core/services/permissions_service.dart';

class AudioService {
  static final AudioService instance = AudioService._();
  AudioService._();

  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  String? _lastRecordPath;
  String? get lastRecordPath => _lastRecordPath;

  Future<bool> startRecording() async {
    try {
      if (!await PermissionsService.requestMicPermission()) {
        print("Mic permission not granted.");
        return false;
      }

      if (await _recorder.isRecording()) {
        print('Already recording');
        return false;
      }

      const RecordConfig config = RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        sampleRate: 44100,
      );

      final dir = await getTemporaryDirectory();
      final filePath =
          '${dir.path}/my_recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await _recorder.start(config, path: filePath);
      print("Recording at $filePath");
      return true;
    } catch (e) {
      print("Error starting recording: $e");
      return false;
    }
  }

  Future<String?> stopRecording({bool playAfter = true}) async {
    try {
      final path = await _recorder.stop();
      _lastRecordPath = path;
      print("Saved recording at $path");

      if (playAfter && path != null) {
        Timer(const Duration(seconds: 1), () {
          playLastRecording();
        });
      }
      return path;
    } catch (e) {
      print("Error stopping recording: $e");
      return null;
    }
  }

  Future<void> playLastRecording() async {
    if (_lastRecordPath == null) return;

    try {
      await _player.setFilePath(_lastRecordPath!);
      _player.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> stopPlayback() async {
    try {
      await _player.stop();
    } catch (e) {
      print("Error stopping playback: $e");
    }
  }

  Future<void> dispose() async {
    await _recorder.dispose();
    await _player.dispose();
  }
}
